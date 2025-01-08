pragma solidity ^0.8.0;

contract BankDeposit {
    // Function to calculate deposit amount after compound interest
    function calculateDepositAfterMonths(uint256 principal, uint256 interestRate, uint256 months) public pure returns (uint256) {
        uint256 depositAmount = principal;
        for (uint256 i = 0; i < months; i++) {
            depositAmount += depositAmount * interestRate / 100;
        }
        return depositAmount;
    }
}
