// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuessingGameWithBetting {
    uint256 public entropy;
    uint256 public sumBet;
    uint256 public minBet;
    uint256 public maxBet;
    address public owner;

    struct Player {
        address playerAddress;
        uint8 guessedNumber;
    }

    Player[] public players;
    Player[] public winners;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    constructor(uint256 _minBet, uint256 _maxBet) {
        owner = msg.sender;
        minBet = _minBet;
        maxBet = _maxBet;
    }

    function play(uint8 _number) public payable {
        require(_number >= 1 && _number <= 10, "Guessed number must be between 1 and 10");
        require(msg.value >= minBet && msg.value <= maxBet, "Bet amount must be within min and max bet");

        // Add player to the players array
        players.push(Player(msg.sender, _number));

        // Accumulate the total prize pool
        sumBet += msg.value;

        // Accumulate entropy
        uint256 hashBlock = uint256(blockhash(block.number));
        uint256 time = block.timestamp;
        entropy += (hashBlock % 1000) + (time % 1000);

        // Check if 10 players have played
        if (players.length == 10) {
            game();
        }
    }

    function game() private {
        delete winners;  // Clear previous round winners
        
        uint8 randomNumber = uint8((entropy % 10) + 1);

        for (uint256 i = 0; i < players.length; i++) {
            if (players[i].guessedNumber == randomNumber) {
                winners.push(players[i]);
            }
        }

        if (winners.length > 0) {
            uint256 prizePerWinner = sumBet / winners.length;
            for (uint256 i = 0; i < winners.length; i++) {
                payable(winners[i].playerAddress).transfer(prizePerWinner);
            }
        }

        sumBet = 0;  // Reset the prize pool
        delete players;  // Clear current round players
    }

    function setBet(uint256 _minBet, uint256 _maxBet) public onlyOwner {
        require(players.length == 0, "Round already started");
        minBet = _minBet;
        maxBet = _maxBet;
    }

    function withdraw() public onlyOwner {
        uint256 contractBalance = address(this).balance;
        uint256 withdrawableAmount = contractBalance - sumBet;
        payable(owner).transfer(withdrawableAmount);
    }

    function getBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    function getWinners() public view returns (Player[] memory) {
        return winners;
    }
}
