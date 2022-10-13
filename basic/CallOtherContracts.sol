// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract CallTestContract {
    // One way to call function from another contract is to initialize the contract
    // function setX(address _test, uint _x) external {
    //     // '_test' is the contract address
    //     TestContract(_test).setX(_x);
    // }

    // Another way is to pass TestContract as type
    function setX(TestContract _test, uint _x) external {
        _test.setX(_x);
    }

    function getX(TestContract _test) external view returns (uint) {
        uint x = _test.getX();
        return x;
    }

    function setXandReceiveEther(TestContract _test, uint _x) external payable{
        // '{value: msg.value}' to send Ether
        _test.setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(TestContract _test) external view returns (uint, uint) {
        // Example of getting more than 1 output
        (uint x, uint value) = _test.getXandValue();
        return (x, value);
    }
}

contract TestContract {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }
}