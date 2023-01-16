// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
contract SendingFunds{
    uint public gas;
    function deposit() public  payable{

    }
    function sendEtherTransfer(address payable _to) public {
        //this is not recommened
        gas=gasleft();
        _to.transfer( 2 ); //2300 gas limit
        gas-=gasleft();
    }

    function SendEtherSend(address payable _to) public  {
        bool sent=_to.send( 2 ether); //2300 gas limit
        require(sent,"Failed to send ether ");
    }

    function SendEtherCall(address payable _to) public payable{
        (bool sent,)=_to.call{gas:10000,value:msg.value}(""); //("") indicates fallback function
        require(sent,"failed to send ether");
    }
}
// 0xd9145CCE52D386f254917e481eB44e9943F39138
// 0xd9145CCE52D386f254917e481eB44e9943F39138