// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DAO {

    mapping(address => bool) public votou;
    uint public votos;

    event Voto(address user);

    function votar() external {
        require(!votou[msg.sender], "Ja votou");

        votou[msg.sender] = true;
        votos++;

        emit Voto(msg.sender);
    }
}