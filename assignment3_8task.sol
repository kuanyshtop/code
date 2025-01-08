pragma solidity ^0.8.0;

contract SumOfDigits {
    // Function that returns the sum of the digits of a number
    function sumOfDigits(uint n) public pure returns (uint) {
        uint sum = 0;
        while (n != 0) {
            sum += n % 10;
            n /= 10;
        }
        return sum;
    }
}
