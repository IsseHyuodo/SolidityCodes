// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


contract Account
{
    mapping(address => uint)  balance;
    address public owner;

    constructor()
    {
        owner = msg.sender;
    }

    function addBalance(uint amt) public
    {

        //
        //
        require(msg.sender == owner, "Stay in your limit");

        uint a = 4;
        uint b = 5;
        uint c = a + b;

        assert(c == 9);

        balance[msg.sender] += amt + c;

    }

    function getBalance() public view returns (uint)
    {
        return balance[msg.sender];
    }

    function transfer(address to, uint amount) public
    {
       
        // if(balance[msg.sender] < amount)
        //     revert("You dont have enough balance");

        require(balance[msg.sender]>=amount, "Insuffienct Balance");
        require(!(msg.sender==to),"Sending money to your own account");
        
        balance[msg.sender] -= amount;
        balance[to] += amount;
        
    }
}