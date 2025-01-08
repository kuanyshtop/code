pragma solidity ^0.8.0;

contract MaxInArray {
    // Function that returns the maximum value in the array
    function maxInArray(int[] memory numbers) public pure returns (int) {
        int max = numbers[0];
        for (uint i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i];
            }
        }
        return max;
    }
}
