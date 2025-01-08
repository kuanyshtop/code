pragma solidity ^0.8.0;

contract ReverseString {
    // Function that returns the reversed string
    function reverseString(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        uint length = strBytes.length;
        for (uint i = 0; i < length / 2; i++) {
            // Swap characters at positions i and length - 1 - i
            (strBytes[i], strBytes[length - 1 - i]) = (strBytes[length - 1 - i], strBytes[i]);
        }
        return string(strBytes);
    }
}
