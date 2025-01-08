// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet {
    address[] public owners;
    uint256 public threshold;
    mapping(address => bool) public isOwner;
    mapping(bytes32 => uint256) public approvals;

    constructor(address[] memory _owners, uint256 _threshold) {
        owners = _owners;
        threshold = _threshold;
        for (uint i = 0; i < _owners.length; i++) {
            isOwner[_owners[i]] = true;
        }
    }

    modifier onlyOwner() {
        require(isOwner[msg.sender], "Not authorized");
        _;
    }

    function submitTransaction(address recipient, uint256 amount) public onlyOwner {
        bytes32 txHash = keccak256(abi.encodePacked(recipient, amount));
        approvals[txHash] += 1;

        if (approvals[txHash] >= threshold) {
            payable(recipient).transfer(amount);
        } else {
            revert("Insufficient approvals");
        }
    }
}
