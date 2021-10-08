/* 
Treinamento Curso PUC
Exercício proposto na aula de 07.10.2021
Autora Stephanie T. Cardoso
Criação em 08/10/2021
*/

pragma solidity 0.8.9;

//SPDX-License-Identifier: MIT
//coloquei esse comentário acima por contado warning na hora de compilar. fonte: https://spdx.org/licenses/


contract CarteiraDaOAB{
    
    string  constant public  TipoDeDocumento   = "CarteiraDaOAB";
    string  constant public  EntidadeEmissora  = "Ordem dos Advogados do Brasil";
    bytes32 constant public  Seccional         = "MG";
    string  constant public  NomeDoAfiliado    = "Stephanie T. Cardoso";
    address constant public  NumeroDaInscricao =  0xBCe52420a8c86F499e8cF11e950C78197deEa504;
    string           public  FiliacaoMae       = "Rosana Trindade";
    string           public  FiliacaoPai       = "Sergio Cardoso";
    string           public  NaturalidadeMun   = "Uberlandia";    
    bytes2           public  NaturalidadeEst   = "MG";
    string           private RGNumero          = "57183472";
    bytes1           private RGDigito          = "x";
    string           private RGEmissor         = "SSP";
    bytes2           private RGEst             = "MG";
    uint             private CPF               =  22981766938;
    uint             public  DataDeNascimento  =  19901207; //coloquei no formato AAAAMMDD pq o dia é 07 e n é possível iniciar com 0. Não sei como resolver da melhor maneira.
    string           public  ExpedidoEm        = ""; 
    
}

