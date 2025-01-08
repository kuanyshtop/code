pragma solidity ^0.8.0;

contract ArithmeticContract {
    int128 public value;

    // Function to store a number in the variable 'value'
    function setValue(int128 _value) public {
        value = _value;
    }

    // Function to return the sum of value and number
    function sum(int128 _number) public view returns (int128) {
        return value + _number;
    }

    // Function to return the difference of value and number
    function difference(int128 _number) public view returns (int128) {
        return value - _number;
    }

    // Function to return the product of value and number
    function product(int128 _number) public view returns (int128) {
        return value * _number;
    }

    // Function to return the result of dividing value by number
    function division(int128 _number) public view returns (int128) {
        require(_number != 0, "Division by zero");
        return value / _number;
    }

    // Function to return the remainder of dividing value by number
    function remainder(int128 _number) public view returns (int128) {
        require(_number != 0, "Division by zero");
        return value % _number;
    }
}
