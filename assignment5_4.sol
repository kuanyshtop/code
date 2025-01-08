// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLockedWallet {
    uint256 public releaseTime;
    address public owner;

    constructor(uint256 _releaseTime) {
        releaseTime = _releaseTime;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    receive() external payable {}

    function withdraw() public onlyOwner {
        require(block.timestamp >= releaseTime, "Funds are locked");
        payable(owner).transfer(address(this).balance);
    }
}
