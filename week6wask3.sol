// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public owner;
    uint256 public startTime;
    uint256 public endTime;
    uint256 public highestBid;
    address public highestBidder;
    mapping(address => uint256) public bids;
    address[] public bidderList; // To keep track of all bidders

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier auctionActive() {
        require(block.timestamp >= startTime && block.timestamp <= endTime, "Auction is not active");
        _;
    }

    modifier auctionEnded() {
        require(block.timestamp > endTime, "Auction has not ended yet");
        _;
    }

    function startAuction(uint256 duration) external onlyOwner {
        startTime = block.timestamp;
        endTime = startTime + duration;
    }

    function placeBid() external payable auctionActive {
        require(msg.value > highestBid, "Bid must be higher than the current highest bid");
        
        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid; // Refund the previous highest bid amount
        }

        if (bids[msg.sender] == 0) {
            bidderList.push(msg.sender); // Add new bidder to the list
        }

        highestBid = msg.value;
        highestBidder = msg.sender;
    }

    function endAuction() external onlyOwner auctionEnded {
        require(highestBidder != address(0), "No bids placed");

        payable(owner).transfer(highestBid);

        // Refund non-winning bidders
        for (uint256 i = 0; i < bidderList.length; i++) {
            address bidder = bidderList[i];
            if (bidder != highestBidder && bids[bidder] > 0) {
                uint256 amount = bids[bidder];
                bids[bidder] = 0;
                payable(bidder).transfer(amount);
            }
        }
    }

    function withdraw() external auctionEnded {
        uint256 amount = bids[msg.sender];
        require(amount > 0, "No funds to withdraw");

        bids[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
