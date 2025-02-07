// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./week7task1.sol";

contract ArrayOperations {
    using IntArrayUtils for int256[];

    int256[] public data;

    constructor(uint256 length) {
        data = IntArrayUtils.init(length);
    }

    function applyMap() public {
        data = data.map(reverse);
    }

    function getSum() public view returns (int256) {
        return data.sum();
    }

    function getProduct() public view returns (int256) {
        return data.mult();
    }

    function reverse(int256 value) internal pure returns (int256) {
        return IntArrayUtils.reverse(value);
    }
}
