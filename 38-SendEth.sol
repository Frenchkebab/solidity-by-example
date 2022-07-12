// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 3 ways to send ETH
// 1) transfer - 2300 gas, reverts if failed
// 2) send - 2300 gas, returns bool
// 3) call - forwards all gas, returns bool and data

// a lot of popular contracts uses either 1) transfer or 3) call,
// they never use 2) send

contract SendEther {
    constructor() payable {}

    receive() external payable {}

    // no fallback -> transaction fails if you call a function that doesn't exist

    // gas : 2260
    // -> 2300 gas was sent to receive() in EtheReceiver, 
    // but while the line42 was being executed, 2260 gas left
    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123); // spends 2300 gas, revert when fails
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123); // spends 2300 gas, false when fails
        require(sent, "send failed");
    }

    // recommended way (forwards all gas)
    function sendViaCall(address payable _to) external payable {
        (bool success, bytes memory data) = _to.call{value: 123}(""); // will cover this later
        require(success, "call failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        // gasleft() - amount of gas that was sent
        emit Log(msg.value, gasleft());
    }
}