// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Donation {
    address public owner;
    mapping(address => uint256) public donators;

    // Set the owner
    function setOwner() public returns(bool) {
        if(owner == address(0)) {
            owner = msg.sender;
            return true;
        }
        return false;
    }

    // Donate Ether
    function donate() public payable {
        donators[msg.sender] += msg.value;
    }

    // Get the amount donated by a specific address
    function getDonater(address _donatorAdr) public view returns(uint256) {
        return donators[_donatorAdr];
    }

    // Get the balance of the contract
    function getBalance() public view returns(uint256) {
        if(msg.sender == owner) {
            return address(this).balance;
        }
        return 0;
    }
}
