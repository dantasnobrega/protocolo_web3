// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./musicatoken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RegistroDeUsuariosComRecompensa is Ownable {

    struct Usuario {
        string nome;
        bool registrado;
    }

    mapping(address => Usuario) public usuarios;

    MusicToken public token;

    event UsuarioRegistrado(address indexed carteira, string nome);

    constructor(address _token) Ownable(msg.sender) {
        token = MusicToken(_token);
    }

    function registrarUsuario(string memory nome) external {
        require(!usuarios[msg.sender].registrado, "Ja registrado");
        require(bytes(nome).length > 0, "Nome vazio");

        usuarios[msg.sender] = Usuario(nome, true);

        emit UsuarioRegistrado(msg.sender, nome);
    }

    function consultarUsuario(address carteira)
        external
        view
        returns (string memory, bool)
    {
        Usuario memory u = usuarios[carteira];
        return (u.nome, u.registrado);
    }
}