// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// visibility
// private - only inside contract
// internal - only inside contract / child contracts
// public - inside and outisde contract
// extrenal - only from outside contract

/*
 ______________________
| A                    |
| private pri()        |
| internal inter()     |
| public pub()         | <-------------- C
| external ext()       |                  pub() and ext()
|______________________|

 ______________________
| B is A               |
| inter()              |
| pub()                | <-------------- C
|______________________|                 pub() and ext() 

*/

contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint) {
        return 0;
    }

    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    function publicFunc() public pure returns (uint) {
        return 200;
    }

    function externalFunc() external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        x + y + z;
        privateFunc();
        internalFunc();
        publicFunc();
        
        // externalFunc(); // cannot access this

        this.externalFunc(); // way to make an external call (gas-inefficient - don't do!)
    }
}

contract VisibilityChild is VisibilityBase {
    function examples2() external view {
        y + z;
        internalFunc();
        publicFunc();
        // not able to call an external function here (same as it is defined here)
    }
}