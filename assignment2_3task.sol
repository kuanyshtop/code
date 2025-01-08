pragma solidity ^0.8.0;

contract StringStorage {
    string public text;

    // Function to set the initial text
    function setText(string memory _text) public {
        text = _text;
    }

    // Function to append new text to the existing text
    function appendText(string memory _newText) public {
        text = string(abi.encodePacked(text, _newText));
    }

    // Function to clear the text
    function clearText() public {
        text = "";
    }

    // Function to return the current value of text
    function getText() public view returns (string memory) {
        return text;
    }
}
