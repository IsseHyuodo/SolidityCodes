// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import from node_modules @openzeppelin/contracts v4.0
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/** 
  *@title Initial Coin Offerring(ICO) contract
*/
contract ICO is ERC20, Ownable {

    // constructor() public ERC20("_name", "_symbol") {
    //  // mint to `msg.sender` 
    //  _mint(msg.sender, _amount*(10**uint256(decimals())));
    //  // mint to `_address`
    //  _mint(_address, _amount*(10**uint256(decimals())));
    // }
    
    // Sample constructor
    constructor(uint initialSupply) ERC20("BasicCoin", "BSC") {
      _mint(msg.sender, initialSupply);
    }
    function mint(address account, uint256 amount) public onlyOwner returns (bool) {
      require(account != address(0) && amount != uint256(0), "ERC20: function mint invalid input");
      _mint(account, amount);
      return true;
    }

    function burn(address account, uint256 amount) public onlyOwner returns (bool) {
      require(account != address(0) && amount != uint256(0), "ERC20: function burn invalid input");
      _burn(account, amount);
      return true;
    }

}