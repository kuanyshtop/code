// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    string public name = "SimpleToken";
    string public symbol = "STK";
    uint256 public totalSupply = 10000 * 10 ** 18;  // 10,000 tokens, assuming 18 decimals
    mapping(address => uint256) public balances;

    // Constructor to assign all tokens to the deployer's address
    constructor() {
        balances[msg.sender] = totalSupply;
    }

    // Transfer function to transfer tokens
    function transfer(address to, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        return true;
    }

    // Balance function to check the balance of a specific address
    function balanceOf(address account) public view returns (uint256) {
        return balances[account];
    }
}
