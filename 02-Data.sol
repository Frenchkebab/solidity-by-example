// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Data types - values and refereneces

contract ValueTypes {
    bool public b = true;
    uint public u = 123; // uint256 0 to 2**256 - 1
    int public i = -123; // int -2**2555 to 2**127 - 1

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    bytes32 public b32; // 32bytes = 32 * 8 = 256bits (moslty for kaccak256)
}