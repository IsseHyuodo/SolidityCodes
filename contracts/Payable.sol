// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Payable {
    //payable adress can send or receive ether
    address payable public owner;
    bool public success=false;
    // payable constructor can only receive ethers
    constructor() payable {
        owner = payable(msg.sender);
    }

    // this function receive ether in smart contract
    function deposit() public payable {}

    // this cannot accept ether
    function nonPayable() public {}

    // call function is low level function used by developers to interact with smart contract
    // here we use to withdraw the ethers from smart contract --- in this case no need to declare it payable
    function withdraw() public {
        uint256 amount = address(this).balance;
        (bool success, ) = owner.call{value: amount}(
            "amount withdrawn from smart contract"
        );
        require(success, "Failed to withdraw ethers");
    }

    // call function no need to declare it payable
    function Transfer(address payable _to, uint256 amount) public  {
        ( success, ) = _to.call{value: (amount*(10**18))}(
            "amount withdrawn from smart contract"
        );
        require(success, "Failed to send ethers to address");
    }
}

// 0x00000000000000000000000017f6ad8ef982297579c203069c1dbffe4348c3720000000000000000000000000000000000000000000000000de0b6b3a7640000
//0xa9059cbb00000000000000000000000017f6ad8ef982297579c203069c1dbffe4348c3720000000000000000000000000000000000000000000000000de0b6b3a7640000
// initial 8 characters in calldata is hexcode for function