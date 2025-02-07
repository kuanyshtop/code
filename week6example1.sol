pragma solidity ^0.8.0;

contract task5 {
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
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(uint256 _minBet, uint256 _maxBet) {
        owner = msg.sender;
        minBet = _minBet;
        maxBet = _maxBet;
    }

    function play(uint8 _number) payable public {
        require(msg.value >= minBet && msg.value <= maxBet, "Invalid bet amount");
        require(_number >= 1 && _number <= 10, "Invalid number");
        players.push(Player(msg.sender, _number));

        uint256 hashBlock = uint256(keccak256(abi.encodePacked(block.timestamp, blockhash(block.number))));
        uint256 time = block.timestamp;
        entropy += (hashBlock % 1000 + time % 1000);

        sumBet += msg.value;

        if (players.length == 10) {
            game();
        }
    }

    function game() private {
        delete winners;

        uint8 randomNumber = uint8((entropy % 10) + 1);

        for (uint256 i = 0; i < players.length; i++) {
            if (players[i].guessedNumber == randomNumber) {
                winners.push(players[i]);
            }
        }

        if (winners.length > 0) {
            distributePrize();
        }

        delete players;
        sumBet = 0;
    }

    function distributePrize() private {
        uint256 prizePerWinner = sumBet / winners.length;

        for (uint256 i = 0; i < winners.length; i++) {
            payable(winners[i].playerAddress).transfer(prizePerWinner);
        }
    }

    function setBet(uint256 _minBet, uint256 _maxBet) onlyOwner public {
        require(players.length == 0, "Round already started");
        minBet = _minBet;
        maxBet = _maxBet;
    }

    function withdraw() onlyOwner public {
        require(address(this).balance > sumBet, "No balance to withdraw");
        payable(owner).transfer(address(this).balance - sumBet);
    }

    function getBalance() onlyOwner public view returns (uint256) {
        return address(this).balance;
    }

    function getWinners() public view returns (Player[] memory) {
        return winners;
    }
}
