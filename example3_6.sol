pragma solidity ^0.8.0;

contract MathOperations {
    // Function that performs mathematical operations based on the operation code
    function performOperation(uint256 number1, uint256 number2, uint256 operation) public pure returns (int256) {
        if (operation == 1) {
            return int256(number1 + number2);  // Sum
        } else if (operation == 2) {
            return int256(number1 - number2);  // Difference
        } else if (operation == 3) {
            return int256(number1 * number2);  // Multiplication
        } else if (operation == 4 && number2 != 0) {
            return int256(number1 / number2);  // Division
        } else {
            revert("Invalid operation or division by zero");
        }
    }
}
