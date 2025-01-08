// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccountBalance {
    // Get the contract's balance
    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }

    // Get the balance of the sender
    function getSenderBalance() public view returns(uint256) {
        return msg.sender.balance;
    }

    // Get the balance of a specific address
    function getAddressBalance(address _adr) public view returns(uint256) {
        return _adr.balance;
    }
}
