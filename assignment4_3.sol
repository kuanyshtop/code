// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public owner;
    address[] public players;

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Enter function to participate in the lottery
    function enter() public payable {
        require(msg.value == 1 ether, "You must send exactly 1 ETH to participate");
        players.push(msg.sender);
    }

    // Pick a winner function, can only be called by the owner
    function pickWinner() public {
        require(msg.sender == owner, "You are not the owner");
        require(players.length > 0, "No players in the lottery");

        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % players.length;
        address winner = players[randomIndex];

        // Send the balance to the winner
        payable(winner).transfer(address(this).balance);

        // Reset the players array after the lottery is completed
        delete players; // Correct way to reset the array
    }
}
