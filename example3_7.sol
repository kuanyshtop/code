pragma solidity ^0.8.0;

contract PrimeNumber {
    // Function to check if a number is prime
    function isPrime(uint256 number) public pure returns (bool) {
        if (number <= 1) {
            return false;
        }
        for (uint256 i = 2; i <= number / 2; i++) {
            if (number % i == 0) {
                return false;
            }
        }
        return true;
    }
}
