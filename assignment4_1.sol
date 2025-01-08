// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;

    // Increment function with a value limit
    function increment(uint256 value) public {
        require(value <= 10, "Value cannot be greater than 10");
        count += value;
    }

    // Decrement function with a value limit
    function decrement(uint256 value) public {
        require(value <= count, "Value cannot be greater than current count");
        count -= value;
    }
}
