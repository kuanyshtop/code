// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedInterestSavings {
    mapping(address => uint256) public deposits;
    uint256 public interestRate = 5; // 5% interest

    receive() external payable {
        deposits[msg.sender] += msg.value;
    }

    function withdrawWithInterest() public {
        uint256 depositAmount = deposits[msg.sender];
        uint256 interest = (depositAmount * interestRate) / 100;
        uint256 totalAmount = depositAmount + interest;

        require(address(this).balance >= totalAmount, "Insufficient balance");
        deposits[msg.sender] = 0;
        payable(msg.sender).transfer(totalAmount);
    }
}
