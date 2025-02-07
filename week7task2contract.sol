// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./week7task2.sol";

contract FunctionCaller {
    FunctionsBank public bank;

    constructor(address bankAddress) {
        bank = FunctionsBank(bankAddress);
    }

    function sendFunction() external {
        bank.addFunction(this.f);
    }

    function f(bytes memory data) external pure returns (bytes memory) {
        int256 number = abi.decode(data, (int256));
        int256 doubled = number * 2;
        return abi.encode(doubled);
    }

    function callFunctionBank(int256 number) external returns (int256) {
        bytes memory data = abi.encode(number);
        bank.callFunction(data);
        bytes memory result = bank.getResult();
        return abi.decode(result, (int256));
    }
}
