// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SendEther {
    // Add keyword 'payable' to this contract to send and receive Ether
    // Note: You must send some Ether to this contract when deploying
    constructor () payable {}

    // Another way is to have payable fallback or receive function
    fallback() external payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        // It takes in the amount to send
        // If this fail, then this whole transaction will fail
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        // It will return a boolean value if the send was successful or not
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    function sendViaCall(address payable _to) external payable {
        // It will return a boolean value and bytes data
        (bool success, ) = _to.call{value: 123}("");
        require(success, "call failed");
    }
}

// For testing
contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}

// Notes
// --------------
// - 3 ways to send ETH
//   1) transfer - 2300 gas, reverts
//   2) send - 2300 gas, returns bool
//   3) call - all gas, returns bool and data