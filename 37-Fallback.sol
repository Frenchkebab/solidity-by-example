// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/*
    Fallback : a special function that gets called when a function that you call 
               doesn't exist inside the contract
               Main usecase of a fallback is to enable direct sending eth
*/

/*
    < When Ether is sent to contract>
    receive() is called when the msg.data is empty
    when receive() does not exist whil msg.data being empty,
    then fallback() will be called

    Ether is sent to contract
                |
            msg.data empty?
                /  \
              yes   no
              /       \
         receive()   fallback()
          exists?
          /     \
    receive()  fallback()
*/

contract Fallback {

    event Log(string func, address sender, uint value, bytes data);

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // receive() external payable {
    //     emit Log("receive", msg.sender, msg.value, "");
    // }
}