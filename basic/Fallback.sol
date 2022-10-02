// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

/*
    fallback() or receive()?

      Ether is sent to contact
                |
        is msg.data empty?
                /   \
              yes     no
             /         \
  receive() exists?    fallback()
          /  \
        yes   no
         /     \
    receive()   fallback()
*/
contract Fallback {
    event Log(string func, address sender, uint value, bytes data);

    // Enable a smart contract to receive Ether
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    // Similar to fallback, it get executed when msg.data is empty
    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}

// Notes
// --------------
// - Fallback is a special function that gets called when a function that you call does not exist inside the contract
// - Main use case of a fallback function is to enable direct sending Ether