// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {
    address private admin;

    // Modifier to restrict access to only admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "You are not the admin");
        _;
    }

    // Constructor to set the admin to the deployer's address
    constructor() {
        admin = msg.sender;
    }

    // Function to change admin address
    function changeAdmin(address newAdmin) public onlyAdmin {
        admin = newAdmin;
    }

    // Restricted function accessible only by admin
    function restrictedFunction() public onlyAdmin view returns (string memory) {
        return "Access granted to admin!";
    }
}
