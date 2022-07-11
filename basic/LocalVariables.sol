// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract LocalVariables {
    uint public i;
    bool public b;
    address public myAddress;

    function foo() external {
        // Local variables
        // This variable only exist inside this function
        // This variable will be gone after the function execute
        uint x = 99;         
        bool f = false;                                   
        x += 12;
        f = true;

        // From State variables
        // These variables will persist after the function is done
        i = 22;
        b = true;
        myAddress = address(1);
    }
}

// Notes
// --------------