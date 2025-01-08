pragma solidity ^0.8.0;

contract SumOfList {
    // Function that returns the sum of all elements in the list
    function sumOfList(int[] memory numbers) public pure returns (int) {
        int sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
}
