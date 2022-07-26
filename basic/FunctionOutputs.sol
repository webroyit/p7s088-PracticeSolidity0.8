// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FunctionOutputs {
    // Example of returning multiple outputs
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    // Example of returning named outputs
    function named() public pure returns (uint x, bool b) {
        return (1, true);
    }
    
    // Returning this way will save you gas
    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    // Example of destructuring assignment
    function destructingAssigments() public pure {
        // Get the output from a function
        (uint x, bool b) = returnMany();

        // Omit the first output value that you do not want
        (, bool _b) = returnMany();
    }
}