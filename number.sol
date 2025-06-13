// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerToRoman {
    function intToRoman(uint256 num) public pure returns (string memory) {
        require(num > 0 && num < 4000, "Input must be between 1 and 3999");

        // 罗马数字的数值和对应字符
        uint256[13] memory values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
        string[13] memory symbols = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];

        string memory result = "";

        for (uint256 i = 0; i < values.length; i++) {
            while (num >= values[i]) {
                result = string(abi.encodePacked(result, symbols[i]));
                num -= values[i];
            }
        }

        return result;
    }
}
