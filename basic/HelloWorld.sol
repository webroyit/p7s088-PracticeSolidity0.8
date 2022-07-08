// SPDX-License-Identifier: MIT     // License of the code
pragma solidity 0.8.7;             // Compiler Version
                                    // ^ Tell compiler that this contract is meant for compiler greater than or equal to 0.8.7
contract HelloWorld {
    string public myString = "Hello World";      // public mean read accress to this variable
}

// Notes
// --------------
// - Best practice is to set specific number of compiler version