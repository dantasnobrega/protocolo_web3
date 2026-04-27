// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MusicNFT is ERC721 {

    uint public nextId;

    constructor() ERC721("MusicNFT", "MNFT") {}

    function mint() external {
        _safeMint(msg.sender, nextId);
        nextId++;
    }
}