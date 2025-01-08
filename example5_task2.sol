pragma solidity ^0.8.0;

contract TwoNumbersContract {
    int16 public number16;
    int256 public number256;

    // Function to initialize number16
    function setNumber16(int16 _number16) public {
        number16 = _number16;
    }

    // Function to initialize number256
    function setNumber256(int256 _number256) public {
        number256 = _number256;
    }

    // Function to return number16
    function getNumber16() public view returns (int16) {
        return number16;
    }

    // Function to return number256
    function getNumber256() public view returns (int256) {
        return number256;
    }

    // Function to return the sum of number16 and number256
    function getSum() public view returns (int256) {
        return number16 + number256;
    }
}
