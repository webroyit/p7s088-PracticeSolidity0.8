// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {
    string public text;

    // aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    // calldata 89426 gas
    // memory 90114 gas
    function set(string calldata _text) external {
        text = _text;
    }

    function get() external view returns (string memory) {
        return text;
    }
}

// Notes
// --------------
// - _ to prevent name conflict between the input text and the state variable text
// - external means that this function can only be called from outside of this contract
// - view means that the function will return the state variable text