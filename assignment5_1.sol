// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerOnlySetter {
    uint256 public value;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function setValue(uint256 _value) public onlyOwner {
        value = _value;
    }
}
