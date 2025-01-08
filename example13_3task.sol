// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractCheck {
    // Check if the address is a contract
    function isContract(address _addr) public view returns(bool) {
        uint256 codeLength;
        assembly { codeLength := extcodesize(_addr) }
        return codeLength > 0;
    }

    // Compare contract address with the current one
    function checkAddress(address _addr) public view returns(string memory) {
        if(isContract(_addr)) {
            if (_addr == address(this)) {
                return "The twin Brother!";
            } else {
                return "This is another contract";
            }
        } else {
            return "This is not a contract";
        }
    }
}
