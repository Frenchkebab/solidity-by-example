// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory lambo = Car({year: 1980, model: "Lamborghini", owner: msg.sender});
        Car memory tesla; // holds default value ("", 0, address(0))
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        // after the function execution is done, memory variables will be gone

        // stored in state array
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));

        // you need to set this as a storage variable to update the state variable
        Car storage _car = cars[0]; 
        _car.year = 1999;
        delete _car.owner; // address(0);

        delete cars[1]; // all data will be reset to its default value
    }
}