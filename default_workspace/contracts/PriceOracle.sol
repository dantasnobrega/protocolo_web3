// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PriceOracle {

    int256 private price;

    constructor() {
        price = 2000 * 1e8; // simula $2000
    }

    function getLatestPrice() public view returns (int256) {
        return price;
    }

    function setPrice(int256 _price) public {
        price = _price;
    }
}