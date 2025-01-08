// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public owner;
    address public recipient;
    uint256 public escrowAmount;

    constructor(address _recipient) {
        owner = msg.sender;
        recipient = _recipient;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    receive() external payable {
        escrowAmount += msg.value;
    }

    function releaseFunds() public onlyOwner {
        payable(recipient).transfer(escrowAmount);
        escrowAmount = 0; // Reset escrow amount after release
    }
}
