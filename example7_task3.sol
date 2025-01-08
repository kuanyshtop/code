pragma solidity ^0.8.0;

contract IteratorContract {
    uint256 public number;
    uint256 public iterator;

    // Function to set the number and call iteration()
    function setNumber(uint256 _number) public returns (int256) {
        number = _number;
        int256 _iterator = iteration();
        return _iterator;
    }

    // Function to iterate and return the iterator
    function iteration() public returns (int256) {
        iterator += 1;
        return int256(iterator);
    }
}
