// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library IntArrayUtils {
    function init(uint256 length) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](length);
        for (uint256 i = 0; i < length; i++) {
            arr[i] = int256(i);
        }
        return arr;
    }

    function map(
        int256[] memory data,
        function(int256) internal pure returns (int256) f
    ) internal pure returns (int256[] memory) {
        for (uint256 i = 0; i < data.length; i++) {
            data[i] = f(data[i]);
        }
        return data;
    }

    function reduce(
        int256[] memory data,
        function(int256[] memory) internal pure returns (int256) f
    ) internal pure returns (int256) {
        return f(data);
    }

    function sum(int256[] memory data) internal pure returns (int256) {
        int256 total = 0;
        for (uint256 i = 0; i < data.length; i++) {
            total += data[i];
        }
        return total;
    }

    function mult(int256[] memory data) internal pure returns (int256) {
        int256 product = 1;
        for (uint256 i = 0; i < data.length; i++) {
            product *= data[i];
        }
        return product;
    }

    function reverse(int256 value) internal pure returns (int256) {
        return value * -1;
    }
}
