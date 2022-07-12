// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Counter {
    uint public count;

    // This function is not view or pure bacause it will write to blockchain
    function inc () external {
        count += 1;
    }

    function dec () external {
        count -= 1;
    }
}

// Notes
// --------------
// - public gives us read access
// - external allow this function to be called after the contract is deployed