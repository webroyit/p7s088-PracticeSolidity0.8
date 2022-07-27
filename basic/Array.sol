// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Array {
    // Initialize Dynamic Array as State Variable
    uint[] public nums = [1, 2, 3];

    // Initialize Fixed Array as State Variable
    // Specify the size of the array in the []
    uint[3] public numsFixed = [4, 5, 6];
    
    function examples() external {
        // Insert (push the element to the end of the array)
        nums.push(4);           // => [1, 2, 3, 4]

        // Get a element from the array
        uint x = nums[1];

        // Update a element from the array
        nums[2] = 777;          // => [1, 2, 777, 4]

        // Delete a element from the array
        // It will clear the element of that nums at index and set it to the default value
        delete nums[1];         // => [1, 0, 777, 4]

        // Pop to shrink the size of the array
        // Pop will remove the last element from the array
        nums.pop();             // => [1, 0, 777]

        // Get the current length of the array
        uint len = nums.length;

        // Create array in memory
        // Specify the size of the array in the ()
        // It a fixed array
        // You cannot use push or pop
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }

    // Memory tells solidity that to copy the state vaiable nums into memory and return it
    function returnArray() external view returns (uint[] memory) {
        return nums;
    }
}

// Notes
// --------------
// Fixed Array means that the size of the array cannot be change (Ex: Shrink or Grow)
// It is not recommended to return an array from the function because it can use a lot of gas if the array is big