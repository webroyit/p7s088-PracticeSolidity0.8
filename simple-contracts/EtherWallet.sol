// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }
    
    // For receiving Ether
    receive() external payable {}

    // function withdraw(uint _amount) external {
    //     require(msg.sender == owner, "caller is not owner");
    //     owner.transfer(_amount);
    // }

    // Best way to save gas
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Caller is not owner");

        payable(msg.sender).transfer(_amount);

        // Another way to send Ether
        // (bool sent,) = msg.sender.call{value: _amount}("");
        // require(sent, "Failed to send Ether");
    }
    
    function gerBalance() external view returns (uint) {
        return address(this).balance;
    }
}