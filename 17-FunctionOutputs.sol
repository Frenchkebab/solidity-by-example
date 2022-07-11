// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Return multiple outputs
// Named Outputs
// Destructuring Assignment

contract FunctionOutputs {
    function returnMany() public pure returns(uint, bool) {
        return (1, true);
    }

    function named() public pure returns(uint x, bool b) {
        return (1, true);
    }

    // You can save a little bit of gas this way
    function assigned() public pure returns(uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructuringAssignments() public pure {
        (uint x, bool b) = returnMany();
        (, bool _b) = returnMany(); // when you need only second output
    }
}