// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Data Locations - storage, memory, and calldata
contract DataLocation {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    // calldata values cannot be change
    function example(uint[] calldata y, string calldata s) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({ foo: 123, text: "bar" });

        // Declare a struct as storage if you want to modify the structure
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        // Declare a struct as memory if you only want to read data
        MyStruct memory readOnly = myStructs[msg.sender];
        // You can modify the structure, but the changes will not be saved if the function is done executing
        readOnly.foo = 456;

        _internal(y);

        // We can only create fixed size array, no dynamic array
        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;

        return memArr;
    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}

// Notes
// --------------
// - storage means that the variable is a state value
// - memory means that the data is loaded onto memory
// - calldata is like memory except it can only be used for function inputs
// - calldata good for saving gas because it does not copy data