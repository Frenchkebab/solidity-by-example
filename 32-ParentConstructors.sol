// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 2 ways to call parent constructors
// Order of initialization

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// Method 1)
constructor U is S("s"), T("t") {

}

// Method 2)
constructor V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

// combination of 1, 2
contract VV is S("s"), T {
    constructor(string memory _Text) T(_text) {

    }
}

// Order of execution
// 1. S
// 2. T
// 3. V0
contract V0 is S, T {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {

    }
}


// Order of execution
// 1. S
// 2. T
// 3. V1
contract V1 is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

// Order of execution
// 1. T
// 2. S
// 3. V2
contract V2 is T, S {
    constructor(string memory _name, string memory _text) T(_text) S(_name) {

    }
}

// Order of execution
// 1. T
// 2. S
// 3. V3
contract V3 is T, S {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {

    }
}

// The order of initialization is determined by the order of inheritance
// regardless of the order of initializers(constructors)