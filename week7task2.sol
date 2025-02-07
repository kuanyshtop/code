// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionsBank {
    struct FunctionStruct {
        function(bytes memory) external pure returns (bytes memory) func;
        bytes result;
        bool isSet; // Flag to indicate if the function has been added
    }

    mapping(address => FunctionStruct) public functions;

    // Add a function to the mapping for the sender
    function addFunction(function(bytes memory) external pure returns (bytes memory) f) external {
        functions[msg.sender] = FunctionStruct(f, "", true); // Set isSet to true
    }

    // Call the stored function for msg.sender and save its result
    function callFunction(bytes memory data) external {
        require(functions[msg.sender].isSet, "Function not added");
        functions[msg.sender].result = functions[msg.sender].func(data);
    }

    // Return the result from the function call
    function getResult() external view returns (bytes memory) {
        return functions[msg.sender].result;
    }
}
