pragma solidity ^0.8.6;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Mycontract is Ownable{
    function normalFunction() external pure returns(string memory){
        return("anyone can call this function");
    }
   
    function specialFunction() external view onlyOwner returns(string memory){
        return("only owner can call this function");
    }
}
