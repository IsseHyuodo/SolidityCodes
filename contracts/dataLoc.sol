//SPDX-License-Identifier:MIT
 pragma solidity ^0.8.6;

contract dataLoc{

     string AcountName="INeuron";
    //  string storage newVar;--error
     function displayName(string memory m) public pure returns(string memory){
         string storage newVar;
         string memory newVariable="hii";
         return newVariable;

     }
     function resultCalldata(string calldata _a)public pure returns(string calldata) {
         return (_a);
        
     }
       function resultMemory(string memory _a)public pure returns(string memory) {
          
         return (_a);
        
     }
     
 }