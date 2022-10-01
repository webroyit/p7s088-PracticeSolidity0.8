// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Payable {
    // Add keyword 'payable' to allow this address to send and receive Ether
    address payable public owner;

    constructor() {
        // Cast msg.sender as payable address
        owner = payable(msg.sender);
    }

    // Send Ether
    function deposit() external payable {}

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}

// Notes
// --------------
// - Add keyword 'payable' to allow send and receive Ether