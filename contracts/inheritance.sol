//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract P1{

    function show() public virtual pure returns(string memory){
        return "in P1";
    }
}

contract P2{

    function show() public virtual pure returns(string memory){
        return "in P2";
    }
}

contract child is P1,P2{

    function show() public override(P1,P2) pure returns(string memory){
        return super.show();
    }
}