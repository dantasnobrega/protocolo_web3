// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegistroMusica {

    struct Musica {
        string titulo;
        string autor;
        string hashArquivo;
        uint256 dataRegistro;
    }

    Musica public ultimaMusica;

    event MusicaRegistrada(
        string titulo,
        string autor,
        string hashArquivo,
        uint256 dataRegistro
    );

    function registrarMusica() public {

        ultimaMusica = Musica(
            "aguaviva",
            "Ubiracy Nobrega",
            "c3ce3ff8a8d593a40b491b31edfcfdee1e137b0f9b175a5edf7ea5f842def29b",
            block.timestamp
        );

        emit MusicaRegistrada(
            "aguaviva",
            "Ubiracy Nobrega",
            "c3ce3ff8a8d593a40b491b31edfcfdee1e137b0f9b175a5edf7ea5f842def29b",
            block.timestamp
        );
    }
}