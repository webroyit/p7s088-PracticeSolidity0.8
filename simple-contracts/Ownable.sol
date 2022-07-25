// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Ownable {
    address public owner;

    // Initialize the owner to the caller that deployed this contract
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;          // If it true, then move on to the next function
    }

    // Set the new owner
    function setOwner(address _newOwner) external onlyOwner {
        // Make sure that the new owner is not a zero address
        require(_newOwner != address(0), "invalid address");

        owner = _newOwner;
    }
}

// Notes
// --------------
// - This contract allow you to claim ownership of the contract
// - It is common in production on mainnet