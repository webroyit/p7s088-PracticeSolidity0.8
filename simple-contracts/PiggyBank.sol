// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// A contract where anyone will be able to deposit Ether into this contract
// Only the owner can withdrawn from it
// This contract will be destroyed after withdrawn
contract PiggyBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);

    address public owner = msg.sender;

    // For receiving Ether
    receive() external payable {
        emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "caller is not owner");
        emit Withdraw(address(this).balance);       // `address(this).balance` to get Ether balance of this contract
        
        // This will delete the contract
        // It takes in the address that will receive all the Ether stored in this contract
        selfdestruct(payable(msg.sender));
    }
}