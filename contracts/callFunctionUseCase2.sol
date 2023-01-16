// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract A{
    event callEvent(address sender, address origin ,address called);
    function callThis() public{
        emit callEvent(msg.sender,tx.origin,address(this));
    }
}

contract Caller{
    function makeCalls(address _contractAddress) public {
    (bool success,)=address(_contractAddress).call(abi.encodeWithSignature("callThis()"));
    require(success,"failure");
    }
}
