// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgResearch {
    uint256 public a;
    uint8 public b;
    string public str;
    address public sender;
    uint256 public value;
    bytes public data;
    bytes4 public sig;

    // Payable function that takes three arguments and initializes msg values
    function researchMsg(uint256 _a, uint8 _b, string memory _str) public payable {
        a = _a;
        b = _b;
        str = _str;

        sender = msg.sender;
        value = msg.value;
        data = msg.data;
        sig = msg.sig;
    }
}
