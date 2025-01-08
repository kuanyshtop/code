// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenMinting {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        // Token minting logic
    }
}
