// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLocked {
    uint256 public unlockTime;
    address public owner;

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Set the unlock time
    function setUnlockTime(uint256 time) public {
        require(msg.sender == owner, "Only the owner can set unlock time");
        unlockTime = time;
    }

    // Withdraw function that is time-locked
    function withdraw() public {
        require(block.timestamp >= unlockTime, "Cannot withdraw before the unlock time");
        payable(msg.sender).transfer(address(this).balance);
    }

    // Receive function to accept ETH
    receive() external payable {}
}
