// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    Delegate Call executes call in another contract in the context of 
    the contract that called it.

    A calls B, sends 100 wei
            B calls C, sends 50 wei
    A ----> B ----> C
                    msg.sender = B
                    msg.value = 50
                    execute code on C's state variables
                    use ETH in C

    A calls B, sends 100 wei
            B delegatecall C
    A ----> B -----------> C
                           msg.sender = A (delegate call preserves the context)
                           msg.value = 100
                           execute code on B's state variables
                           use ETH in B (if a function in C sends ETH to another contract)

*/

// this contract can be changed
contract TestDelegateCall {
    // these state variable won't be updated (uninitialized)
    // ! the order of these state variables should be same 
    address public owner; // we changed the storage layout
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = 2 * _num;
        sender = msg.sender;
        value = msg.value;
    }
}

// this contract won't be changed
contract DelegateCall {
    // these state variables will be updated instead of those in TestDelgateCall
    // ! make sure that original state variables are declared in the same order!
    uint public num;
    address public sender;
    uint public values;

    function setVars(address _test, uint _num) external payable {
        // two lines below do the exact same thing.
        // The bottom one just doesn't have to do it by using string

        // _test.delegateCall(abi.encodeWithSignature("setVars(uint256)", _num));
        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        require(success, "delegatecall failed");
    }
}
