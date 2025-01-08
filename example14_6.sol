// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomWallet3 {
    address public owner;

    // Custom Errors
    error badOwner(address sender);
    error badValue(uint256 balance, uint256 value);
    error badSignature(bytes input);

    constructor() {
        owner = msg.sender;
    }

    // Fallback function
    fallback() external payable {
        revert badSignature(msg.data);
    }

    function receiveFunds() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function transferEth(address payable recipient, uint256 value) public {
        if (msg.sender != owner) revert badOwner(msg.sender);
        if (address(this).balance < value) revert badValue(address(this).balance, value);
        recipient.transfer(value);
    }

    function changeOwner(address newOwner) public {
        if (msg.sender != owner) revert badOwner(msg.sender);
        owner = newOwner;
    }
}
