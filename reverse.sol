// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringReverser {
    function reverse(string memory _input) public pure returns (string memory) {
        bytes memory strBytes = bytes(_input);
        uint256 len = strBytes.length;
        for (uint256 i = 0; i < len / 2; i++) {
            // 交换字符
            bytes1 temp = strBytes[i];
            strBytes[i] = strBytes[len - 1 - i];
            strBytes[len - 1 - i] = temp;
        }
        return string(strBytes);
    }
}
