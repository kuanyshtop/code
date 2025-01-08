pragma solidity ^0.8.0;

contract GreaterNumber {
    // Function that returns the greater of two numbers
    function greater(uint256 number1, uint256 number2) public pure returns (uint256) {
        if (number1 >= number2) {
            return number1;
        } else {
            return number2;
        }
    }
}
