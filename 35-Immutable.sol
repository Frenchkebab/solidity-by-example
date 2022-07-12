// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    'immutable' is just like 'constant',
    except that you can initialize it only once when the contract is deployed
*/

contract Immutable {
    // we can set it only once when the contract is deployed
    // just like constant, deploying a variable as immutable saves some gas

    // foo : 52576 gas
    // address public owner = msg.sender; 

    // foo : 50123 gas
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }
    
    uint public x;
    
    function foo() external {
        require(msg.sender == owner);
        x += 1;
    }
}
