pragma solidity ^0.8.0;

contract MultiCalculator {
    int256 public sum;
    int256 public sub;
    int256 public mult;
    int256 public div;

    // Function to start calculations
    function start(int256 number1, int256 number2) public returns (int256, int256, int256, int256) {
        addition(number1, number2);
        subtraction(number1, number2);
        multiplication(number1, number2);
        division(number1, number2);
        return getResult();
    }

    // Internal function for addition
    function addition(int256 number1, int256 number2) internal {
        sum = number1 + number2;
    }

    // Internal function for subtraction
    function subtraction(int256 number1, int256 number2) internal {
        sub = number1 - number2;
    }

    // Internal function for multiplication
    function multiplication(int256 number1, int256 number2) internal {
        mult = number1 * number2;
    }

    // Internal function for division
    function division(int256 number1, int256 number2) internal {
        require(number2 != 0, "Division by zero");
        div = number1 / number2;
    }

    // Internal function to return all results
    function getResult() internal view returns (int256, int256, int256, int256) {
        return (sum, sub, mult, div);
    }
}
