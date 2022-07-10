// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract StateVariables {
    uint public myUint = 99;        // 99 is store on the blockchain

    function foo() external {
        // Local variable
        uint notStateVariable = 77;         // This variable only exist inside this function
                                            // This variable will be gone after the function execute
    }
}

// Notes
// --------------
// - State variable are variables that store data on the blockchain
// - Variable declared inside a function are local variable