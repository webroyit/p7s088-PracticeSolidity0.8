// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Constructor {
    address public owner;
    uint public x;

    constructor(uint _x) {
        owner = msg.sender;         // The address that deployed this contract
        x = _x;
    }
}

// Notes
// --------------
// - Constructor is a function that are only called once when the contract is deployed
// - Constructor is mostly used to initialize state variables