// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuessTheNumber {
    uint256 private secretNumber;

    // Constructor to initialize the secret number
    constructor(uint256 _secretNumber) {
        secretNumber = _secretNumber;
    }

    // Guess function
    function guess(uint256 guessedNumber) public view returns (bool) {
        return guessedNumber == secretNumber;
    }
}
