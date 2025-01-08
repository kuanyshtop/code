pragma solidity ^0.8.0;

contract ArithmeticOperations {
    uint256 public value;

    // Function to add _value to value (public)
    function add(uint256 _value) public {
        value += _value;
    }

    // Function to subtract _value from value (external)
    function subtract(uint256 _value) external {
        value -= _value;
    }

    // Function to multiply value by _value (internal)
    function multiply(uint256 _value) internal {
        value *= _value;
    }

    // Function to divide value by _value (private, prevent division by zero)
    function divide(uint256 _value) private {
        require(_value != 0, "Division by zero");
        value /= _value;
    }
}
