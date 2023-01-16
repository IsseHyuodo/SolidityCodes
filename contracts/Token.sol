// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Token{

    string public name ="Ineuron Token";
    string public symbol="INT";
    uint public totalSupply=1000;
    address public owner;
    mapping(address=>uint) balances;
    constructor(){
        owner=msg.sender;
        balances[owner]=1000;
    }
    function Transfer(address to,uint amt) external{
        // checks u can add if u want to
        balances[msg.sender]-=amt;
        balances[to]+=amt;
    }
    function getBalance(address ac) external view returns(uint){
        return balances[ac];

    }
}
