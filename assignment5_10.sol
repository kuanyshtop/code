// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenVesting {
    address public owner;
    address public beneficiary;
    uint256 public releaseDate;
    uint256 public vestedAmount;

    constructor(address _beneficiary, uint256 _releaseDate) {
        owner = msg.sender;
        beneficiary = _beneficiary;
        releaseDate = _releaseDate;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function claimTokens() public {
        require(block.timestamp >= releaseDate, "Tokens are locked");
        payable(beneficiary).transfer(vestedAmount);
    }

    receive() external payable {
        vestedAmount += msg.value;
    }
}
