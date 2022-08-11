// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    // As State Variable
    Car public car;

    // As Array
    Car[] public cars;

    // As Mapping
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        // 3 Ways to Initialize a struct
        // ex 1)
        // Parameters must be put in the order that this struct was declared 
        Car memory toyota = Car("Toyota", 1990, msg.sender);

        // ex 2)
        Car memory lambo = Car({ model: "Lamborghini", year: 1980, owner: msg.sender });

        // ex 3)
        // This struct is only exist within this function
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        // Add these struct to []cars
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);
        cars.push(Car("Ferrari", 2020, msg.sender));

        // Access a struct from []cars
        // storage will allow update on car struct 
        Car storage _car = cars[0];
        _car.year = 1990;

        // Delete to reset the values to default values on struct
        delete _car.owner;
        delete cars[1];
    }
}

// Notes
// --------------
// - Struct allow you to group data together
// - Use storage instead of memory to update the variable