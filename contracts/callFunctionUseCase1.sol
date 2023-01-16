// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract CallContract{
    string public Str="Blockchain";
    //if 1 ether is sent in msg.value, then update the string
    function updateString(string memory _newString) public payable returns(uint,uint){
        uint startGas1=gasleft();
        require(msg.value== 1 ether);      
        Str=_newString;
        address payable 

//select any address from accounts as owner to reflect change in balance 
owner=payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        (bool success,)=owner.call{value:msg.value}("");
        require(success,"failure");
        return(startGas1,startGas1-gasleft());
    }
}
