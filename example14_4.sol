// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not owner");
        _;
    }

    function receiveFunds() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferEth(address payable recipient, uint256 value) public onlyOwner {
        require(address(this).balance >= value, "Insufficient balance");
        recipient.transfer(value);
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}
