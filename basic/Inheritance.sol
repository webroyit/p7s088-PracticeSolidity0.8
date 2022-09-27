// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Parent Contract
contract A {
    // virtaul make this function inherited and customized by the child contract
    function foo() public pure virtual returns (string memory) {
        return "A";
    }

    function bar() public pure virtual returns (string memory) {
        return "A";
    }

    function baz() public pure returns (string memory) {
        return "A";
    }
    // More code here
}

// Child Contract
contract B is A {
    // override to customized this function
    function foo() public pure override returns (string memory) {
        return "B";
    }

    function bar() public pure virtual override returns (string memory) {
        return "B";
    }

    

    // More code here
}

contract C is B {
    function bar() public pure override returns (string memory) {
        return "C";
    }
}

// Notes
// --------------
// - Add keyword 'virtual' to make a function inherited and customized by the child contract
// - Add keyword 'is' to inherited from a contract
// - Add keyword 'override' to customized a function