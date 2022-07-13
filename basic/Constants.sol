// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 21442 gas cost
contract Constants {
    address public constant MY_ADDRESS = 0x0000300000000000000000000000000000000000;
    uint public constant MY_UINT = 123;
}

// 23575 gas
contract Var {
    address public MY_ADDRESS = 0x0000000000000000000000300000000000000000;
    uint public MY_UINT = 123;
}

// Notes
// --------------
// - Define a variable as constant if you know that it will never change
// - constant variable use less gas thant state variable