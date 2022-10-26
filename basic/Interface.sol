// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// contract Counter {
//     uint public count;

//     function inc() external {
//         count += 1;
//     }

//     function dec() external {
//         count -= 1;
//     }
// }

interface ICounter {
    function count() external view returns (uint);
    function inc() external;
}

contract CallInterface {
    uint public count;

     function examples(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}

// Notes
// --------------
// - Interface allows you to call other contracts without having its code
// - You only need to pass the contract address to access the contract state variables and functions