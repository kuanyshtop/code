// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AutoPayment {
    address public owner;
    address public autoPay;
    uint256 public minDonate;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not owner");
        _;
    }

    modifier minDonationCheck(uint256 value) {
        require(value >= minDonate, "You're a greedy");
        _;
    }

    function setMinDonate(uint256 _minDonate) public onlyOwner {
        minDonate = _minDonate;
    }

    function setAddress(address _autoPay) public onlyOwner {
        autoPay = _autoPay;
    }

    function donate() public payable minDonationCheck(msg.value) {
        uint256 donation = msg.value;
        uint256 payment = donation / 100; // 1% fee
        payable(autoPay).transfer(payment);
    }

    function withdraw(uint256 value) public onlyOwner {
        require(value <= address(this).balance, "Not enough balance");
        payable(owner).transfer(value);
    }
}
