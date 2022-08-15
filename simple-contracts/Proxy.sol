// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        require(msg.sender == owner, "not owner");
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }

    function setOwner(address _owner) public {
        require(msg.sender == owner, "not owner");
        owner = _owner;
    }
}

contract Proxy {
    event Deploy(address);

    // To get ETH back
    fallback() external payable {}

    // It takes in a contract to deploy
    // It is payable so that we can send ETH
    // _code the actual code starts after 32 bytes
    function deploy(bytes memory _code) external payable returns (address addr) {
        assembly {
           // create(v, p, n)
           // v = amount of ETH to send to the contract that is being deploy
           // p = pointer in memory to start of code (where in memory does our code start)
           // n = size of code

           // msg.value inside assembly does not work
           // 0x20 = 32 in hexadecimal
           // `add(_code, 0x20)` skips the first 32 bytes
           // size of the code is stored in the first 32 bytes
           // return the address
           addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }

        require(addr != address(0), "deploy failed");

        emit Deploy(addr);
    }

    // _target is the address of the contract to call
    // _data is some dat to send to the target contract
    function execute(address _target, bytes memory _data)
        external
        payable
    {
        (bool success, ) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

// Notes
// --------------
// - A contract that can deploy any arbitrary contract
// - msg.value inside assembly does not work
// - 0x address means there is an error on creating the contract
// - When calling another contract, it might send some ETH back