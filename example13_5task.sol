// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {
    address public owner;

    // Receive function to accept Ether
    receive() external payable {}

    // Set the owner to the first caller
    function setOwner() public returns(bool) {
        if(owner == address(0)) {
            owner = msg.sender;
            return true;
        }
        return false;
    }

    // Get the contract balance
    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }

    // Transfer Ether to an address
    function transferEthToAddress(address payable _adr, uint256 value) public {
        require(msg.sender == owner, "You are not owner");
        _adr.transfer(value);
    }

    // Change the owner of the contract
    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "You are not owner");
        owner = newOwner;
    }
}
