// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Data Locations - storage, memory and calldata
// storage - state variable
// memory - data is loaded onto memory
// calldata - like memory, except that it can only be used for function input (not modifiable, and can save some gas)

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(uint[] calldata y, string calldata s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"}); // storage

        MyStruct storage myStruct = myStructs[msg.sender]; // storage (when you want to modify)
        myStruct.text = "foo"; // this updates the state variable

        MyStruct memory readOnly = myStructs[msg.sender]; // memory (when you only want to read)
        readOnly.foo = 456; // this change won't be saved

        _internal(y);

        uint[] memory memArr = new uint[](3); // for array initialized in memory, you only can use fixed-sized array
        memArr[0] = 234;
        return memArr;
    }

    // if y was memory, then it would copy each element into the memory
    // if y is calldata, it skips copying
    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}