//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract Function{
// function to return multiple value
 functionExt E=new functionExt();
function returnMultiple() public pure returns(uint,bool,uint){
    return(5,false,10);
}
function returnName() public pure returns(uint x,bool b,int y){
    return(1,true,-5);
}
function AssignValues() public pure returns(uint x,bool b,uint y){
    return (x,b,y);

}
function destructuring() public view returns(uint,bool,uint,uint){
   
  (uint i,bool b,uint j)=returnMultiple();
   i=300;
  (uint x,uint m,uint y)=(10,15,20);
  E.A();
  return (i,b,j,m);


}

}

// Work it out
contract functionExt{
     
    function A() public pure returns(string memory){
        return"Hii";
    }

}

contract SecondFunction{
   
// msg.sender concept

    // function SecondFunctionContract(uint x,uint y,uint z, address a ,bool b,string memory c)
    // public pure returns (uint){
    //     return 10;

    // }
    //  function callFunction() external view returns(address){
    //      return (msg.sender);
    //  }


     function SecondFunctionContract(address a, bool b) public pure returns(address,bool){
         return (a,b);
     }

     function callFunction()  external pure returns(address,bool){
         return SecondFunctionContract(address(0),true);
     }

     function callFunctionWithKeyValue() external pure returns(address,bool){
         return SecondFunctionContract({a: address(0),b:true});
     }
 }




contract Account{

    address public senderAddress;
    uint public balance;
    function setAddressAndBalance() public{
        senderAddress=msg.sender;
        balance=msg.sender.balance;
    }
    function transferToReceiver(address payable to) public  payable   {
        to.transfer(msg.value);
    }
}
