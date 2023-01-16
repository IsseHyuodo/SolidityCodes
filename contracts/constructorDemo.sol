//SPDX-License-Identifier:MIT
 pragma solidity ^0.8.6;

 contract A{

     uint public  num;
     constructor(uint _num){
         num=_num;
     }
     modifier check(uint num2){
         if(num2>=5){
             _;  // bind the statement of function update to this line which means all the statement of function will put here
         }
     }
    function update (uint _num) public check(_num)  {
        num+=_num;
      
    }
 }
// contract B is A{

//      uint public  num1;
//      constructor(uint _num){
//          num1=_num;
//      }
//       function C() public override{

//      }
//  }