pragma solidity ^0.8.0;

contract SortedList {
    // Function that returns true if the list is sorted in ascending order
    function isSorted(int[] memory numbers) public pure returns (bool) {
        for (uint i = 0; i < numbers.length - 1; i++) {
            if (numbers[i] > numbers[i + 1]) {
                return false;
            }
        }
        return true;
    }
}
