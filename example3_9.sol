pragma solidity ^0.8.0;

contract GCD {
    // Function to find the greatest common divisor using the Euclidean algorithm
    function gcd(uint256 number1, uint256 number2) public pure returns (uint256) {
        while (number2 != 0) {
            uint256 temp = number2;
            number2 = number1 % number2;
            number1 = temp;
        }
        return number1;
    }
}
