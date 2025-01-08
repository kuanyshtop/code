// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerContract {
    address public owner = address(0);

    // Set the first caller as owner
    function setOwner() public returns(bool) {
        if(owner == address(0)) {
            owner = msg.sender;
            return true;
        } else {
            return false;
        }
    }

    // Change owner if called by current owner
    function changeOwner(address newOwner) public returns(bool) {
        if(msg.sender == owner) {
            owner = newOwner;
            return true;
        } else {
            return false;
        }
    }
}
