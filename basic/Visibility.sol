// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Visibility
// private - only inside contract
// internal - only inside contract and child contracts
// public - inside and outside contract
// external - only from outside contract

/*
    A
    private pri()
    internal inter()
    public pub()        <-------- C
    external ext()        pub() and ext()

    B is A
    inter()             <-------- C
    pub()                 pub() and ext()
*/
contract VisibilityBase {
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;

    function privateFunc() private pure returns (uint) {
        return 0;
    }

    function internalFunc() internal pure returns (uint) {
        return 100;
    }

    function publicFunc() public pure returns (uint) {
        return 200;
    }

    function externalFunc() external pure returns (uint) {
        return 300;
    }

    function examples() external view {
        x + y + z;

        privateFunc();
        internalFunc();
        publicFunc();

        // You cannot call external function inside the contract
        //externalFunc();

        // A hacky way to call external function is to use 'this'
        // It like calling another contract
        // It is gas inefficient
        this.externalFunc();
    }
}

contract VisibilityChild is VisibilityBase {
     function example2() external view {
        y + z;
        internalFunc();
        publicFunc();
    }
}

// Notes
// --------------
// - private means that the function or the state variable can only be access from within the contract that defines it
// - internal is similar to private except that a child contract can also access it
// - public state variables and functions can be access from both inside and outside contract
// - external function can only be called from other contracts