// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Event {
    // It takes in data to log
    event Log(string message, uint val);

    // - Keyword 'indexed' allow you to search for an event
    event IndexedLog(address indexed sender, uint val);

    // This is a tranaction function because emit write data to the blockchain
    // You can indexed up to 3 data
    function example() external {
        emit Log("foo", 123);
        emit IndexedLog(msg.sender, 745);
    }

    event Message(address indexed from, address indexed to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}

// Notes
// --------------
// - Event allows you to write data on the blockchain
// - Event can be fetch from the contract
// - The main purpose of event is to log that something happen
// - Event can be used to store data once and the contract does not have to fetch them