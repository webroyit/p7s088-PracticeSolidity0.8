// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // Basic
    modifier whenNotPaused() {
        require(!paused, "paused");
        _;          // _ call the next function that this function modifier wraps
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }
    
    // Inputs
    modifier cap(uint _x) {
        require(_x < 100, "x >= 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    // Sandwich
    modifier sandwich() {
        // Code
        count += 10;
        // Call the main function
        _;
        // More code
        count += 2;
    }

    function foo() external sandwich {
        count += 1;
    }
}

// Notes
// --------------
// - Function Modifier allow you to reuse code
// - Sandwich is when some code will be executed inside the function modifier.  The actual function will be called and afterwards it will excute more code inside the function modifier