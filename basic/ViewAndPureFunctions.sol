// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ViewAndPureFunctions {
    uint public num;

    // View Function
    function viewFunc() external view returns (uint) {
        return num;
    }

     // Pure Function
    function pureFunc() external pure returns (uint) {
        return 1;
    }
}

// Notes
// --------------
// - The difference between View and Pure functions is that View function can read data from the blockchain and Pure cannot read blockchain data
// - View Function does not modifiy any state variables or write anything to the blockchain
// - View Function can read data from the blockchain. ex - state variables
// - Unlike View Function, Pure Function cannot read blockchain data such as state variables