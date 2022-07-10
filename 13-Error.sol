pragma solidity ^0.8.7;

// three Ways to throw an error
// 1) require
// 2) revert
// 3) assert

// gass refund, state updates are reverted
// custom error - save gas!

contract Error {
    function testRequire(uint _i) public pure {
        require(_i <= 10, "i > 10");
    }

    function testRevert(uint _i) public pure {
        if(_i > 10) {
            revert("i>10");
        }
    }

    uint public num = 123;
    function testAssert() public view {
        assert(num == 123);
    }

    function foo() public {
        // accidentlally update num
        num += 1;
        require(_i < 10);
    }

    error MyError(address caller, uint i); // Custom Error can be use only with revert

    function testCustomError(uint _i) public view {
        // the longer the message, the more gas is used
        require(_i <= 10, "very long error message error error error error"); 
        if (_i > 10) {
            revert MyError(msg.sender, _i);
        }
    }
}