pragma solidity ^0.8.0;

contract Power {
    // Function to calculate base raised to the power of exponent
    function power(uint256 base, uint256 exponent) public pure returns (uint256) {
        uint256 result = 1;
        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }
        return result;
    }
}
