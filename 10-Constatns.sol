// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constants {
    // gas : 21442 (cheaper)
    address public constant MY_ADDRESS = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
    uint public constant MY_UINT = 123;
}

contract Var {
    // gas : 23553
    address public MY_ADDRESS = 0x70997970C51812dc3A010C7d01b50e0d17dc79C8;
}