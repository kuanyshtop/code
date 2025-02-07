// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    uint256 public ticketPrice;
    address[] public participants;
    address public owner;
    uint256 public prizePool;

    constructor(uint256 _ticketPrice) {
        ticketPrice = _ticketPrice;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function buyTicket() external payable {
        require(msg.value >= ticketPrice, "Insufficient Ether sent for ticket");
        participants.push(msg.sender);
        prizePool += msg.value;
    }

    function drawWinner() external onlyOwner {
        require(participants.length > 0, "No participants in the lottery");

        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % participants.length;
        address winner = participants[randomIndex];

        payable(winner).transfer(prizePool);

        // Reset the lottery
        delete participants;
        prizePool = 0;
    }

    function setTicketPrice(uint256 _price) external onlyOwner {
        ticketPrice = _price;
    }
}
