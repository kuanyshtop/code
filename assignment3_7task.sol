pragma solidity ^0.8.0;

contract EvenNumbers {
    // Function that returns a new array with even numbers
    function filterEvenNumbers(int[] memory numbers) public pure returns (int[] memory) {
        uint count = 0;
        // First, count the number of even numbers
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                count++;
            }
        }
        
        int[] memory evens = new int[](count);
        uint index = 0;
        // Then, add even numbers to the result array
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[index] = numbers[i];
                index++;
            }
        }
        return evens;
    }
}
