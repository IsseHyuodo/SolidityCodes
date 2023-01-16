pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract IneuronToken is ERC20 {

    //constructor will initialize a smart contract
    constructor(uint256 initialSupply) ERC20("Ineuron", "INT") {
        //_mint is used to create new tokens
        _mint(msg.sender, initialSupply);
    }
}
