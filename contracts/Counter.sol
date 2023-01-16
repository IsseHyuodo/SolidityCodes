//SPDX-License-Identifier:MIT
pragma solidity ^0.8.3;

contract Counter{
     uint  count; // state variable stores on blockchain

     function sum() public pure returns(uint){
         return 2+3;
     }

     function getCount() public view  returns(uint){  //view can be place before or after public
         return count;
     }
      function inc()  public{  
           // function needs to be called so we are making it public to give it access to run

        uint local;
        // local variable used for temporary purpose not store in a blockcain once theyre scope is over they sre removed from memory
        count++;
    }


         function dec()  public{   
             count--;
    }

}