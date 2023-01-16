// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// abstract contract  calcTemplate{
//     function op(uint num1,uint num2)  public virtual returns(uint);
//     function print() public pure returns(uint){
//         return 1;
//     }
// }

interface  calcTemplate{
    function op(uint num1,uint num2)  external returns(uint);
}

contract Add is calcTemplate{
    function op(uint num1,uint num2)  public pure override returns(uint){
        return num1+num2;
    }
}