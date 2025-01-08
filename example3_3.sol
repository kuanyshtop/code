pragma solidity ^0.8.0;

contract ConditionalCheck {
    // Function that returns true if a satisfies the conditions, otherwise false
    function checkConditions(uint256 a, uint256 b, uint256 c) public pure returns (bool) {
        if ((a > b && a > c) || (a > c && a < b)) {
            return true;
        }
        return false;
    }
}
