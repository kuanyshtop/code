pragma solidity ^0.8.0;

contract EvenNumber {
    // Function that returns true if the number is even, otherwise false
    function isEven(uint256 number) public pure returns (bool) {
        return number % 2 == 0;
    }
}
