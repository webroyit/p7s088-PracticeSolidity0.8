// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;


// Examples
// ["fire", "water", "wind ]                        // Slow without mapping because you have to loop through the array
// ["fire": true, "water": true, "wind": true]      // Fast without mapping
contract Mapping {
    // Simple Mapping
    // Define the key type and value type
    mapping(address => uint) public balances;

    // Nested Mapping
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        // Set
        balances[msg.sender] = 123;
        // Get
        uint bal = balances[msg.sender];
        // Using Undefined address
        uint bal2 = balances[address(1)];        // Default value  (ex => 0)
        // Update
        balances[msg.sender] = 456;
        // Delete
        delete balances[msg.sender];            // Reset it to default value  (ex => 0)

        // Set value for Nested Mapping
        isFriend[msg.sender][address(this)] = true;
    }
}

// Notes
// --------------
// - Mapping is like a dictionary in Python
// - Mapping allows for efficient lookup