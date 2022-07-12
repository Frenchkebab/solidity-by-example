// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    two ways to create a new contract from another contract
    1) create 
    2) create2 (will cover later)
*/

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
}

contract AccountFactory {
    Account[] public accounts;

    function createAccount(address _owner) external payable {
        Account account = new Account{value: 111}(_owner); // create a contract
        accounts.push(account);
    }
}