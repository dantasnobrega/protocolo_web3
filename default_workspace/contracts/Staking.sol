// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./musicatoken.sol";
import "./PriceOracle.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Staking is ReentrancyGuard {

    MusicToken public token;
    PriceOracle public oracle;

    mapping(address => uint256) public stakes;

    event Staked(address user, uint256 amount);
    event RewardPaid(address user, uint256 amount);

    // 🔥 agora recebe token E oracle
    constructor(address _token, address _oracle) {
        token = MusicToken(_token);
        oracle = PriceOracle(_oracle);
    }

    function stake(uint256 amount) external nonReentrant {
        require(amount > 0, "Valor invalido");

        token.transferFrom(msg.sender, address(this), amount);
        stakes[msg.sender] += amount;

        emit Staked(msg.sender, amount);
    }

    function reward() external nonReentrant {
        require(stakes[msg.sender] > 0, "Sem stake");

        int256 price = oracle.getLatestPrice();
        require(price > 0, "Preco invalido");

        // 🔥 cálculo mais seguro
        uint256 rewardAmount = (stakes[msg.sender] * uint256(price)) / 1e9;

        token.reward(msg.sender, rewardAmount);

        emit RewardPaid(msg.sender, rewardAmount);
    }
}