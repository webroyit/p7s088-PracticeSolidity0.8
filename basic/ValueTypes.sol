// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Data types - values and references

contract ValueTypes {
    bool public b = true;

    // Unsigned Integer means that the number has to be greater than or equal to zero 
    uint public u = 99;         // uint = uint256 0 to 2**256 - 1
                                //      = uint8   0 to 2**8 - 1
                                //      = uint16  0 to 2**16 - 1

    int public i = -99;         // uint = uint256 -2**256 to 2**256 - 1
                                //      = uint128 -2**127 to 2**127 - 1
                                //      = uint16  0 to 2**16 - 1

    int public minInt = type(int).min;          // Find the minimum value
    int public maxInt = type(int).max;          // Find the max value

    address public addr = "0xCed00C448865C0732a245a5049243E39A1Ec47A0";
    bytes32 public b32 = "0xCed00C448865C0732a245a5049243E39A1Ec47A0Ced00C448865C0732a245a5049243E39A1Ec47A0";
}

// Notes
// --------------
// - Values means that the data stores a value (ex boolean, true or false)
// - References do not store value
// - References store a reference to where the actual data is stored (ex array, where the actual array elements are stored)