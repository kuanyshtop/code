// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EqualEtherDistribution {
    // Accept Ether
    receive() external payable {}

    // Distribute ether equally among addresses
    function distributeEqually(address[] memory _addresses) public {
        uint256 totalAmount = address(this).balance;
        uint256 amountPerAddress = totalAmount / (_addresses.length + 1);
        
        for (uint i = 0; i < _addresses.length; i++) {
            payable(_addresses[i]).transfer(amountPerAddress);
        }

        // Keep one part in the contract
    }
}
