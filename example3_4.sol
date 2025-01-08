pragma solidity ^0.8.0;

contract Factorial {
    // Function to calculate the factorial of a number
    function calculateFactorial(uint256 n) public pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }
}
