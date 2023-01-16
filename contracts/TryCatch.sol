// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract A
{
    function doSomething() external 
    {
        //assert();
    }
}
contract B
{
    A a = new A();
    string public status="Not available";

    function go() public
    {
        try a.doSomething()
        {
            status = "Success";
        } 
        catch 
        {
            status = "Failed";
        }

       
        
        
    }
}