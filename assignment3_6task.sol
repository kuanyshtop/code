pragma solidity ^0.8.0;

contract VowelCounter {
    // Function that returns the count of vowels in the string
    function countVowels(string memory str) public pure returns (uint) {
        uint count = 0;
        bytes memory strBytes = bytes(str);
        for (uint i = 0; i < strBytes.length; i++) {
            if (
                strBytes[i] == 0x61 || // 'a'
                strBytes[i] == 0x65 || // 'e'
                strBytes[i] == 0x69 || // 'i'
                strBytes[i] == 0x6f || // 'o'
                strBytes[i] == 0x75     // 'u'
            ) {
                count++;
            }
        }
        return count;
    }
}
