//SPDX-License-Identifier:MIT
pragma solidity 0.8.6;

contract loops {
    // solidity does not allow print statement
    // arrays in solidity
    uint256[] public data;
    uint8 j = 0; // EVM can know at any point of time it can have only 8 bits of memory no need to declare memory

    function loop1() public returns (uint256[] memory) {
        while (j < 20) {
            j++;
            data.push(j);
        }
        return data;
    }
     function getArrayData() public view returns (uint256[] memory) {
        return data;
    }
}
