pragma solidity 0.8.9;

contract CartaoDeVacinacao {
    //autor: Stephanie T. Cardoso
    string  constant public nome = "Stephanie T. Cardoso";
    uint    public   cnes = 1234567;
    uint    public   data = 7122021;
    uint    private  lote = 1092014;
    string  constant public fabricante ="Astrazeneca";
    string  public   vacinador = "Jessica";
    bool    public   imunizado = true;
    address private  wallet = 0xBCe52420a8c86F499e8cF11e950C78197deEa504;
}
