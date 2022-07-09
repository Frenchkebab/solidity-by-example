// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFunctions {
    uint public num;

    function viewFunc() external view returns (uint) {
        return num; // reads state variable
    }

    function pureFunc() external pure returns (uint) {
        return 1; // does not read/write any data from blockchain
    }

    // Reads state variable
    function addToNum(uint x) external view returns (uint) {
        return num + x;
    }

    // Does not read state variables
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}