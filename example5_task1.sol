pragma solidity ^0.8.0;

contract SimpleContract {
    int64 public value;
    
    // Function to store a number in the variable 'value'
    function setValue(int64 _value) public {
        value = _value;
    }

    // Function to return the value of 'value' (view function)
    function getValue() public view returns (int64) {
        return value;
    }
}
