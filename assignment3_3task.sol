pragma solidity ^0.8.0;

contract PerfectSquare {
    // Function to check if a number is a perfect square
    function isPerfectSquare(uint256 n) public pure returns (bool) {
        uint256 sqrt = sqrtUint(n);
        return sqrt * sqrt == n;
    }

    // Helper function to compute integer square root
    function sqrtUint(uint256 n) internal pure returns (uint256) {
        uint256 x = n;
        uint256 y = (x + (n / x)) / 2;
        while (y < x) {
            x = y;
            y = (x + (n / x)) / 2;
        }
        return x;
    }
}
