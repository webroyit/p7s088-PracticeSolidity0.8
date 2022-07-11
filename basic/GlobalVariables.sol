// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract GlobalVariables {
    // view is like pure, read only function
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;           // This is a Global Variable that stores the address that called this function
        uint timestamp = block.timestamp;      // This is a Global Variable that stores unix timestamp of when this function was called
        uint blockNum = block.number;          // This is a Global Variable that stores the current block number
        return (sender, timestamp, blockNum);
    }
}

// Notes
// --------------
// - Global Variables store information such as blockchain transaction and the account that call the function
// - view function can read data from State Variables and Global Variables