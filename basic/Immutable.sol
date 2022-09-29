// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Immutable {
    // 45718 gas
    // address public owner = msg.sender;

    // 43585 gas
    address public immutable owner = msg.sender;

    uint public x;
    function foo() external {
        require(msg.sender == owner);
        x += 1;
    }
}

// Notes
// --------------
// - Use immutable if you do not want a variable to change
// - Immutable can only be initialized when the contract is deployed and then it cannot be change
// - Declaring a state variable as immutable will save some gas