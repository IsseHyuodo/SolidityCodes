// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

contract Array{

uint[] public nums;
     function getValues() public view returns(uint[] memory){
         return nums;
     }  


function removeAtIndexByShifting(uint index) public returns(uint) {
         uint num=nums[index];
        for(uint i=index;i<nums.length-1;i++) {
            nums[i]=nums[i+1];
        }
        nums.pop();
         return num;
     } 

}