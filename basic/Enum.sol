// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Enum {
    // Declare and define enum
    enum Status {
        None,       // Default value
        Pending,
        Shipped,
        Rejected,
        Canceled
    }

    // Declare enum as state variable
    Status public status;

    // Use enum inside a struct
    struct Order {
        address buyer;
        Status status;
    }
    Order[] public orders;

    // Return enum
    function get() view external returns (Status) {
        return status;
    }

    // Take enum as input
    function set(Status _status) external {
        status = _status;
    }

    // Update a value of enum
    function ship() external {
        status = Status.Shipped;
    }

    // Reset a value of enum to the first item that was define in enum
    function reset() external {
        delete status;
    }
}

// Notes
// --------------
// - enum is good for choices