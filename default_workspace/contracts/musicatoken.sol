// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MusicToken is ERC20, Ownable {

    //  contratos autorizados (ex: Staking)
    mapping(address => bool) public autorizados;

    constructor() ERC20("MusicToken", "MUSIC") Ownable(msg.sender) {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // modifier para permitir owner OU contratos autorizados
    modifier onlyAutorizado() {
        require(
            msg.sender == owner() || autorizados[msg.sender],
            "Nao autorizado"
        );
        _;
    }

    //  autorizar contrato (ex: staking)
    function autorizar(address _addr) external onlyOwner {
        autorizados[_addr] = true;
    }

    //  reward agora pode ser chamado pelo staking
    function reward(address to, uint256 amount) external onlyAutorizado {
        require(to != address(0), "Endereco invalido");
        require(amount > 0, "Valor invalido");

        _mint(to, amount);
    }
}