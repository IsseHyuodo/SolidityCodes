//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

// view function declares that no state will be changed--Data Abstraction (partial abstraction)

// pure function declares that no state will be changed or read--Data hiding(complete abstraction)
contract viewPure{
  //internal
  uint x=1;
  function addX(uint y) public view returns(uint){
      // here we are able to value of x
      uint c=x+y;
      return c;
  }

   function AddX(uint i,uint j) public pure returns(uint){
      uint d=i+j;
      return d;
  }

}

// deploying contract on this address-0x5B38Da6a701c568545dCfcB03FcB875f56beddC4