// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract FallbackReceive{

    string public called="";
    uint public amount=0;
    bytes public data;
    receive() external payable{
        called="receive";
         amount=msg.value;
         
    }
     fallback() external payable{
        called="receive";
         amount=msg.value;
         data=msg.data;
         
    }
     function  CallData(bytes memory d) public {
        called="receive";
        data=msg.data;
         
    }

// 0xff51a1a2000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000011200000000000000000000000000000000000000000000000000000000000000
//0x000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000011200000000000000000000000000000000000000000000000000000000000000

}