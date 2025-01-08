// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingsAccount {
    mapping(address => uint256) public balances;

    // Deposit function to send ETH and update the balance
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // Withdraw function to allow users to withdraw their ETH
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
