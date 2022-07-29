// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract IterableMapping {
    mapping(address => uint) public balances;       // Balances
    mapping(address => bool) public inserted;       // Keep track whether a key is inserted or not
    address[] public keys;                          // Keep track of all of the keys that was inserted into array

    function set(address _key, uint _val) external {
        balances[_key] = _val;

        if (!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function first() external view returns (uint) {
        return balances[keys[0]];
    }
    
    function last() external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }

    function get(uint _i) external view returns (uint) {
        return balances[keys[_i]];
    }
}

// Notes
// --------------
// - We cannot get the size of a mapping
// - We cannot iterate mapping to get all the elements