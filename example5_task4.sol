pragma solidity ^0.8.0;

contract CalculatorContract {

    // Function for addition
    function add(int256 a, int256 b) public pure returns (int256) {
        return a + b;
    }

    // Function for subtraction
    function subtract(int256 a, int256 b) public pure returns (int256) {
        return a - b;
    }

    // Function for multiplication
    function multiply(int256 a, int256 b) public pure returns (int256) {
        return a * b;
    }

    // Function for division
    function divide(int256 a, int256 b) public pure returns (int256) {
        require(b != 0, "Division by zero");
        return a / b;
    }

    // Function for remainder of division
    function remainder(int256 a, int256 b) public pure returns (int256) {
        require(b != 0, "Division by zero");
        return a % b;
    }
}
