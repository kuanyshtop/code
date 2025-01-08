pragma solidity ^0.8.0;

contract VotingSystem {
    uint256 public votesFor;
    uint256 public votesAgainst;

    // Function to increment votesFor
    function voteFor() public {
        votesFor += 1;
    }

    // Function to increment votesAgainst
    function voteAgainst() public {
        votesAgainst += 1;
    }

    // Function to return the current votesFor and votesAgainst
    function getVotes() public view returns (uint256, uint256) {
        return (votesFor, votesAgainst);
    }

    // Function to reset both counters to zero (internal)
    function resetVotes() internal {
        votesFor = 0;
        votesAgainst = 0;
    }
}
