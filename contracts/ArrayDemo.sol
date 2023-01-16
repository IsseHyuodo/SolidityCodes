//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract Array{

    uint[] public nums;
     function getValues() public view returns(uint[] memory){
         return nums;
     }    
      function getLength() public view returns(uint){
         return nums.length;
     }  
      function addNumber(uint num) public {
         return nums.push(num);
     }  
     function removeNumber() public returns(uint) {
         uint num=nums[nums.length-1];
          nums.pop();
         return num;
     }  

      function removeAtIndex(uint index) public returns(uint) {
          uint num=nums[index];
          delete nums[index];
           return num;
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