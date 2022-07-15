// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ForAndWhileLoops {
    function loops() external pure {
        // For Loop
        for (uint i = 0; i < 10; i++) {
            // code
            if (i == 3) {
                continue;       // Skip one iteration of a loop
            }
            // more code
            if (i == 5) {
                break;          // Exit the loop
            }
        }

        // While Loop
        uint j = 0;
        while (j < 10) {
            // code
            j++;
        }
    }

    function sum(uint _n) external pure returns (uint) {
        uint s;

        for (uint i = 1; i <= _n; i++) {
            s += 1;
        }

        return s;
    }
}

// Notes
// --------------
// - Setting the condition to true means that the while loop run forever
// - The bigger the number of loops, the more gas it will use