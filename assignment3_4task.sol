pragma solidity ^0.8.0;

contract Palindrome {
    // Function that checks if a number is a palindrome
    function isPalindrome(int n) public pure returns (bool) {
        int original = n;
        int reversed = 0;
        while (n != 0) {
            int digit = n % 10;
            reversed = reversed * 10 + digit;
            n /= 10;
        }
        return original == reversed;
    }
}
