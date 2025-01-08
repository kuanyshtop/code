pragma solidity ^0.8.0;

contract TokenManagement {
    uint256 public totalSupply;
    uint256 public balance;

    // Function to mint tokens and add them to the totalSupply
    function mint(uint256 _amount) public {
        totalSupply += _amount;
    }

    // Function to decrease the balance by _amount
    function transfer(uint256 _amount) public {
        require(balance >= _amount, "Insufficient balance");
        balance -= _amount;
    }

    // Function to increase the balance by _amount
    function receiveTokens(uint256 _amount) public {
        balance += _amount;
    }

    // Function to get the totalSupply and balance
    function getTokenInfo() public view returns (uint256, uint256) {
        return (totalSupply, balance);
    }
}
