// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public highestBidder;
    uint256 public highestBid;

    function placeBid() public payable {
        require(msg.value > highestBid, "Bid too low");
        if (highestBidder != address(0)) {
            payable(highestBidder).transfer(highestBid); // Refund previous highest bidder
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
    }
}
