// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ArrayShift {
    uint[] public arr;

    function examples() public {
        arr = [1, 2, 3];
        delete arr[1];          // [1, 0, 3]
    }

    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1] -- remove (0) --> [1] --> []
    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }

        arr.pop();
    }
}

// Notes
// --------------
// - Calling delete method does not remove the element.  It only reset it to default value