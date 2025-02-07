// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuessingGame {
    uint256 public entropy;
    
    struct Player {
        address playerAddress;
        uint8 guessedNumber;
    }

    Player[] public players;
    Player[] public winners;

    function play(uint8 _number) public {
        require(_number >= 1 && _number <= 10, "Guessed number must be between 1 and 10");

        // Add player to the players array
        players.push(Player(msg.sender, _number));

        // Accumulate entropy
        uint256 hashBlock = uint256(blockhash(block.number));  // Assumption for Remix IDE
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

        delete players;  // Clear current round players
    }

    function getWinners() public view returns (Player[] memory) {
        return winners;
    }
}
