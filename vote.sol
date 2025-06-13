// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public owner;

    // 存储候选人得票数
    mapping(string => uint256) private votes;

    // 用于记录所有添加过的候选人名称，方便重置
    string[] private candidateList;

    // 防止重复添加候选人
    mapping(string => bool) private candidateExists;

    constructor() {
        owner = msg.sender;
    }

    // 投票给某个候选人
    function vote(string memory candidate) public {
        // 如果是第一次为这个候选人投票，将其加入候选人列表
        if (!candidateExists[candidate]) {
            candidateList.push(candidate);
            candidateExists[candidate] = true;
        }

        votes[candidate]++;
    }

    // 获取某个候选人的得票数
    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }

    // 重置所有候选人的得票数（仅合约拥有者可调用）
    function resetVotes() public onlyOwner {
        for (uint256 i = 0; i < candidateList.length; i++) {
            votes[candidateList[i]] = 0;
        }
    }

    // 限制器：只有合约拥有者可以调用
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}
