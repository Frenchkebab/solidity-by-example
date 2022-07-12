// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    'call' is a low-level function we use to send eth
*/

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was cancelled");
    }

    function foo(string memory _message, uint _x) external payable returns(bool, uint) {
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call {
    bytes public data;

    function callFoo(address _test) external payable {
        // 5000 gas won't be enough to update state variable 'message' so will fail
        (bool success, bytes memory _data) = _test.call{value: 111}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );
        require(success, "call failed");
        data = _data;
    }

    // if you remove fallback() then the transaction fails
    function callDoesNotExist(address _test) external {
        (bool success, ) = _test.call(abi.encodeWithSignature("doesNotExist()"));
        require(success, "call faild");
    }
}