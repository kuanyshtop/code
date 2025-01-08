// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Task1 {
    string public str;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setString(string memory _str) public {
        require(msg.sender == owner, "You are not owner");
        str = _str;
    }
}
