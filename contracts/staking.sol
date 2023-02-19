//SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

error TransferFailed();
error NeedMoreThanZero();

contract staking is ReentrancyGuard{
event Log(uint txnAmount);
IERC20 public s_stakingToken;
IERC20 public s_rewardsToken;


//this is reward token per second
uint256 public constant REWARD_RATE=100;
uint256 public s_lastUpdateTime;
uint256 public s_rewardPerTokenStored;

mapping(address=>uint256) public s_userRewardPerTokenPaid;
mapping(address=>uint256) public s_rewards;


uint256 private s_totalSupply;
mapping(address=>uint256)public s_balances;

event Staked(address indexed user,uint256 indexed amount);
event withdrawnStake(address indexed user,uint256 indexed amount);
event RewardsClaimed(address indexed user,uint256 indexed amount);

constructor(address stakingToken,address rewardsToken){
s_stakingToken=IERC20(stakingToken);
s_rewardsToken=IERC20(rewardsToken);
}
// how much reward a token gets based on how long its been in the contract

function rewardPerToken()public view returns(uint256){

    if(s_totalSupply==0){
        //revert TransferFailed();
        return s_rewardPerTokenStored;
    }
    return s_rewardPerTokenStored+(((block.timestamp-s_lastUpdateTime)*REWARD_RATE*1e18)/s_totalSupply);
}

function earned(address account) public view returns(uint256){
    return((s_balances[account]*(rewardPerToken()-s_userRewardPerTokenPaid[account]))/1e18)+s_rewards[account];
}


function stake(uint256 amount) external updateReward(msg.sender) nonReentrant  moreThanZero(amount){
    s_totalSupply+=amount;
    s_balances[msg.sender]+=amount;
    emit Staked(msg.sender,amount);
       //revert TransferFailed(_msgSender());
    // bool success=s_stakingToken.transferFrom(msg.sender,address(this),amount); it uses in case of approval


    bool success=s_stakingToken.transfer(address(this),amount);

   
    //revert TransferFailed();
    if(!success){
        revert TransferFailed();
    }
}
function withdraw(uint256 amount) external nonReentrant updateReward(msg.sender){
    s_totalSupply-=amount;
    s_balances[msg.sender]-=amount;
    emit Staked(msg.sender,amount);
    bool success=s_stakingToken.transfer(msg.sender,amount);
    if(!success){
        revert TransferFailed();
    }
}

function claimReward()external nonReentrant updateReward(msg.sender){
    uint256 reward=s_rewards[msg.sender];
    s_rewards[msg.sender]=0;
    emit RewardsClaimed(msg.sender,reward);
    bool success=s_rewardsToken.transfer(msg.sender,reward);
    if(!success){
        revert TransferFailed();
    }

}
modifier updateReward(address account){
    s_rewardPerTokenStored=rewardPerToken();
    emit Log(s_rewardPerTokenStored);

    s_lastUpdateTime=block.timestamp;
    emit Log(s_lastUpdateTime);

    s_rewards[account]=earned(account);
     emit Log(s_rewards[account]);

    s_userRewardPerTokenPaid[account]=s_rewardPerTokenStored;
    emit Log(s_userRewardPerTokenPaid[account]);

    _;
}
modifier moreThanZero(uint256 amount){
    if(amount==0){
        revert NeedMoreThanZero();
    }
    _;
}
function getStaked(address account)public view returns(uint256){
    return s_balances[account];
}
}