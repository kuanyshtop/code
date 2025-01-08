pragma solidity ^0.8.0;

contract Fibonacci {
    // Function to return the nth Fibonacci number
    function fibonacci(uint256 n) public pure returns (uint256) {
        if (n == 0) {
            return 0;
        }
        else if (n == 1) {
            return 1;
        }
        
        uint256 a = 0;
        uint256 b = 1;
        uint256 fib;
        
        for (uint256 i = 2; i <= n; i++) {
            fib = a + b;
            a = b;
            b = fib;
        }
        
        return fib;
    }
}
