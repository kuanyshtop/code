// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PermissionedTokenTransfer {
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 1000; // Initial balance for the contract owner
    }

    modifier hasEnoughBalance(address sender, uint256 amount) {
        require(balances[sender] >= amount, "Insufficient balance");
        _;
    }

    function transfer(address recipient, uint256 amount) public hasEnoughBalance(msg.sender, amount) {
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
