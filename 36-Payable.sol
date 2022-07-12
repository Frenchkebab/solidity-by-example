// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    By declaring an address as payable, 
    the address will be able to send ether.

    And by declaring a function as payable,
    you can call the function sending ether.
*/

contract Payable {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable {}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}