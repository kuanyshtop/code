pragma solidity ^0.8.0;

contract CalculatorContract {
    int256 public operand1;
    int256 public operand2;
    int256 public result;
    string public operationName;

    // Function for addition
    function add(int256 a, int256 b) public returns (int256) {
        operand1 = a;
        operand2 = b;
        result = a + b;
        operationName = "Addition";
        return result;
    }

    // Function for subtraction
    function subtract(int256 a, int256 b) public returns (int256) {
        operand1 = a;
        operand2 = b;
        result = a - b;
        operationName = "Subtraction";
        return result;
    }

    // Function for multiplication
    function multiply(int256 a, int256 b) public returns (int256) {
        operand1 = a;
        operand2 = b;
        result = a * b;
        operationName = "Multiplication";
        return result;
    }

    // Function for division
    function divide(int256 a, int256 b) public returns (int256) {
        require(b != 0, "Division by zero");
        operand1 = a;
        operand2 = b;
        result = a / b;
        operationName = "Division";
        return result;
    }

    // Function for remainder of division
    function remainder(int256 a, int256 b) public returns (int256) {
        require(b != 0, "Division by zero");
        operand1 = a;
        operand2 = b;
        result = a % b;
        operationName = "Remainder";
        return result;
    }

    // Function to get information about the last operation
    function getLastOperation() public view returns (int256, int256, int256, string memory) {
        return (operand1, operand2, result, operationName);
    }
}
