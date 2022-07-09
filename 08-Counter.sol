// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter {
    uint public count;

    // Neither view nor pure because these are not read-only function
    function inc() external {
        count += 1;
    }

    function dec() external  {
        count -= 1;
    }

    
}