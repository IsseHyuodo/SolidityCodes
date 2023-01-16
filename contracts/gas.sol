//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract gasLimit{
   

   uint public i=0;
   function runForever() public {
       while(true){
           i++;
       }

   }


}