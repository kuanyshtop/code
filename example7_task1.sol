pragma solidity ^0.8.0;

contract MemoryModifiers {
    uint256 public number1;
    uint256 public number2;

    // Function to initialize the variables
    function setNumbers(uint256 _number1, uint256 _number2) public {
        number1 = _number1;
        number2 = _number2;
    }

    // Function to return the values of number1 and number2
    function getNumbers() public view returns (uint256, uint256) {
        return (number1, number2);
    }

    // Function to return the sum of input number and the two variables
    function sumWithNumbers(uint256 _number) public view returns (uint256) {
        return number1 + number2 + _number;
    }

    // Function to return the sum of two input integers
    function sumTwoNumbers(uint256 _num1, uint256 _num2) public pure returns (uint256) {
        return _num1 + _num2;
    }
}
