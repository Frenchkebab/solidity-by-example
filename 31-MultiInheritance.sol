// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// ORder of inheritance - most base-like to derived

/*
        X
      / |
    Y   | 
     \  |
        Z
*/

// Z inherits from both X and Y
// contract that is most base-like is the contract that inherits the least (X)
// between Y and Z, most base-like contract is Y

/*
       X
     /  \
    Y    A
    |    |
    |    B
     \   /
       Z
*/

// in this case, X is the most base-like
// (in order) X / Y, A / B / Z

contract X {
    function foo() public pure virtual returns (string memory) {
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "Y";
    }

    function bar() public pure virtual override returns (string memory) {
        return "Y";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}

// won't be compiled if Y, X
contract Z is X, Y{
    // override(X, Y) or override(Y, X) doesn't matter
    function foo() public pure override(X, Y) returns (string memory) {
        return "Z";
    }

    function bar() public pure  override(Y, X) returns (string memory) {
        return "Z";
    }
}