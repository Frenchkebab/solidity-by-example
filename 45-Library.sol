// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// you can't define state variable
library Math {
    // We're using library function inside another contract so doesn't make sense
    // to make it external
    // And also private does not make sense since it means 
    // we'll have to use this function only inside this library
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for(uint i = 0; i < arr.length; i++) {
            if(arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}

contract TestArray {
    using ArrayLib for uint[]; // attach functions in ArrayLib to uint[] type
    uint[] public arr = [3,2,1];

    function testFind() external view returns(uint i) {
        // return ArrayLib.find(arr, 2);
        return arr.find(2);
    }
}