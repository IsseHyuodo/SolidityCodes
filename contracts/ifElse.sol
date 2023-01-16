//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract ifElse{

    function condition(int x) public pure returns(int){

        if(x==10)
           return 0;
        else if(x>10)
        return 1;
        else
           return -1;
    }
}