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
    
    string  constant public  vTipoDeDocumento   = "CarteiraDaOAB";
    string  constant public  vEntidadeEmissora  = "Ordem dos Advogados do Brasil";
    bytes2  constant public  vSeccional         = "MG";
    string  constant public  vNomeDoAfiliado    = "Stephanie T. Cardoso";
    address constant public  vNumeroDaInscricao =  0xBCe52420a8c86F499e8cF11e950C78197deEa504;
    string           public  vFiliacaoMae       = "Rosana Trindade";
    string           public  vFiliacaoPai       = "Sergio Cardoso";
    string           public  vNaturalidadeMun   = "Uberlandia";    
    bytes2           public  vNaturalidadeEst   = "MG";
    uint64           private vRGNumero          =  57183472;  //usei numérico para economizar espaço, pq uint64 corresponde a 4 bytes, que é suficiente para guardar o número de 8 números de RG. Se usar bytes8, precisarei de 8 bytes. 
    bytes1           private vRGDigito          = "x";        //alfanumérico e será sempre 1
    string           private vRGEmissor         = "SSP";
    bytes2           private vRGEst             = "MG";
    uint128          private vCPF               =  22981766938;
    uint             public  vDataDeNascimento  =  19901207; //coloquei no formato AAAAMMDD pq o dia é 07 e n é possível iniciar com 0. Não sei como resolver da melhor maneira.
    string           public  vExpedidoEm        = ""; 
    
}
