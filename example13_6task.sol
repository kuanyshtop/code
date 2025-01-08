// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherTransfer {
    receive() external payable {}

    // Get the contract balance
    function getContractBalance() public view returns(uint256) {
        return address(this).balance;
    }

    // Get the sender's balance
    function getMyBalance() public view returns(uint256) {
        return msg.sender.balance;
    }

    // Get the balance of a specific address
    function getAddressBalance(address _adr) public view returns(uint256) {
        return _adr.balance;
    }

    // Send Ether to the sender
    function giveMeEth(uint256 value) public {
        if(address(this).balance >= value) {
            payable(msg.sender).transfer(value);
        }
    }

    // Transfer Ether to another address
    function transferEthToAddress(address _adr, uint256 value) public {
        if(address(this).balance >= value) {
            payable(_adr).transfer(value);
        }
    }
}
