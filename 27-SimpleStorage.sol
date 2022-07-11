// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    string public text;

    // fine to use memory but you can save gas by using calldata
    // calldata 89626 gas
    // memory 90114 gas
    function set(string calldata _text) external {
        text = _text;
    }

    // we will be returning state variable, so view
    function get() external view returns (string memory) {
        return text;
    }
}