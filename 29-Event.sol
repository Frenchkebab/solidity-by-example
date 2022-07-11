// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Event {
    event Log(string message, uint val);
    // up to 3 params can be indexed
    event IndexedLog(address indexed sender, uint val);

    // we're storing some new data onto the blockchain, so it's not read-only(view, pure)
    function example() external {
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) exeternal {
        emit Message(msg.sender, _to, message);
    }
}