// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergeSortedArray {
    // 合并两个升序数组并返回新的升序数组
    function mergeSortedArrays(uint[] memory arr1, uint[] memory arr2) public pure returns (uint[] memory) {
        uint m = arr1.length;
        uint n = arr2.length;
        uint[] memory result = new uint[](m + n);

        uint i = 0; // 指向 arr1
        uint j = 0; // 指向 arr2
        uint k = 0; // 指向 result

        while (i < m && j < n) {
            if (arr1[i] <= arr2[j]) {
                result[k++] = arr1[i++];
            } else {
                result[k++] = arr2[j++];
            }
        }

        // 如果 arr1 还有剩余
        while (i < m) {
            result[k++] = arr1[i++];
        }
