/* 
Treinamento Curso PUC
Autora Stephanie T. Cardoso
Criação em 06/10/2021
Modelo Utilizado: https://www.melhoresdestinos.com.br/novo-passaporte-10-anos.html
*/
    
pragma solidity 0.8.9;

//SPDX-License-Identifier: MIT
//coloquei esse comentário acima por contado warning na hora de compilar. fonte: https://spdx.org/licenses/

contract PassaporteBrasileiro 

{
   
    bytes1  TipoDePassaporte;   //como o tipo de passaporte contém apenas um caráter, tentei usar esse tipo para economizar memória e gás. Mas lendo a documentação, parece que não é verdade, pq a EVM opera de 32 em 32 bytes e reduzir esse range é custoso.
    bytes1  Sexo;
    bool    Homologado;         //criei esse critério de validade só para usar uma variável do tipo boolean
    uint8   DataDoNascimento;   //aqui pensei na hipótese a data ser armazenada como DDMMXXXX, sem as barras...se guardássemos as barras, seria string, certo? 
    uint8   DataDeExpedicao;
    uint8   DataDeValidade;
    uint128 RG;
    uint    NumeroDoPassaporte; //uint = uint26? //acho que é alfanumérico, mas considerei que os dois AAs que ocupamas duasprimeiras posições são fixos
    string  PaisEmissor;
    string  Sobrenome;
    string  Nacionalidade;
    string  AutoridadeEmissora;
    address Wallet;             //supondo que os passaportes fossem registrados na plataforma ethereum hehehe

}

//dúvida:Layout of State Variables Storage (entendi direito essa questão?)

