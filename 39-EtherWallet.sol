// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    only owner will be send eth out of this contract
*/
contract EtherWallet {
    address payable public owner;
    
    constructor() {
        owner = payable(msg.sender);
    }

    // we want the transaction to fail when someone calls any function that does not
    // exist in this contract
    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        
        /* 
            owner - state variable (more gas)
            msg.sender - memory variable (less gas)
        */
        // owner.transfer(_amount);
        payable(msg.sender).transfer(_amount);

        // code below do the same thing
        // (bool sent,) = msg.sender.call{value: _amount}("");
        // require(sent, "Failed to send Ether");
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}