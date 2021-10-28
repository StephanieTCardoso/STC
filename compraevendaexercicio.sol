pragma solidity 0.8.9;

//SPDX-License-Identifier: MIT 

contract CompraVenda {
    
    address public comprador;
    address public vendedor; 
    
    string public matricula; 
    string public cartorio;
    
//    string dataDeVencimento;
    
    bool quitado = false;
    
    uint public valorTotal;
    uint public valorDaEntrada;
    uint public quantidadeDeParcelas;
    uint public porcentagemDaMulta; 
    uint public valorDaParcela;
    uint public valorEmAberto;
    
    uint public dataDeCelebracao = block.timestamp;
    uint public dataDeVencimentoEntrada;
    uint public dataDeVencimentoDaParcela; 
    uint public numeroDaParcela = 0; // 0 = Entrada
    uint public prazoParaPagamentos; //em dias
//    uint public proximaParcela;
    
    
    constructor(
        uint _valorTotal,
        uint _valorDaEntrada,
        uint _quantidadeDeParcelas,
        string memory _matricula,
        string memory _cartorio,
        address _vendedor,
 //       uint _dataDeCelebracao,
        uint _prazoParaPagamentos
 //       uint _proximaParcela
        ) 
    {
        vendedor = _vendedor;
        valorTotal = _valorTotal;
        valorDaEntrada = _valorDaEntrada;
        quantidadeDeParcelas = _quantidadeDeParcelas;
        matricula = _matricula;
        cartorio = _cartorio;
        valorEmAberto = valorTotal;
        valorDaParcela = funcaoValorParcela();
  //      dataDeCelebracao = _dataDeCelebracao;
        prazoParaPagamentos = _prazoParaPagamentos; // em dias
  //      proximaParcela; _proximaParcela;
        
    }
    
    function calcularVencimentos () public returns (uint) {
            if (numeroDaParcela == 0){
                dataDeVencimentoEntrada = dataDeCelebracao + DtoS(prazoParaPagamentos);
                return (dataDeVencimentoEntrada);
                }
            if (numeroDaParcela >= 1){
                dataDeVencimentoDaParcela = (dataDeVencimentoEntrada + (numeroDaParcela * DtoS(prazoParaPagamentos)));
                return (dataDeVencimentoDaParcela);
            }
//        return(dataDeVencimentoEntrada);
    }
    
    function pagarEntrada(uint _valorPagamento) public returns (uint, string memory) {
        require(block.timestamp <= calcularVencimentos(),  "Pagamento da entrada em atraso");
        require(_valorPagamento == valorDaEntrada,         "Valor da entrada incorreto.");
        require(valorEmAberto   == valorTotal,             "Entrada ja foi paga.");
            comprador                 = msg.sender;
            valorEmAberto             = valorTotal - _valorPagamento;
            dataDeVencimentoEntrada   = dataDeCelebracao + DtoS(prazoParaPagamentos);
            numeroDaParcela           = numeroDaParcela + 1;
            dataDeVencimentoDaParcela = (dataDeVencimentoEntrada + DtoS(prazoParaPagamentos));
        return(valorEmAberto, "valor em aberto");
    }
    
    function pagarParcela(uint _valorPagamento) public returns (uint, string memory) {
        require(block.timestamp <= calcularVencimentos(),      "Pagamento da parcela em atraso");
        require(numeroDaParcela  >  0,                         "Pague a entrada antes de pagar as parcelas.");
        require(numeroDaParcela  <= quantidadeDeParcelas,      "Nao ha mais parcelas a serem pagas!");
        require(valorEmAberto    <= valorTotal-valorDaEntrada, "Entrada nao foi foi paga.");
        require(_valorPagamento  == valorDaParcela,            "Valor da parcela incorreto");
        require(comprador        == msg.sender,                "Obrigado, somente o comprador pode executar essa funcao");
            valorEmAberto             = valorEmAberto - _valorPagamento;
//            dataDeVencimentoDaParcela = DtoS((dataDeVencimentoEntrada + peridiocidade) + (numeroDaParcela * peridiocidade)),
            numeroDaParcela           = numeroDaParcela + 1;
        return(valorEmAberto,     "valor em aberto");
    }
    
    function funcaoValorParcela() public view returns (uint){
        uint calculoValorParcela = (valorTotal-valorDaEntrada)/quantidadeDeParcelas;
        return(calculoValorParcela);
    }
    
    function valorDaMulta(uint _porcentagemDaMulta) public view returns(uint, string memory) {
        uint multa = _porcentagemDaMulta*valorTotal/100;
        return(multa, "valor da multa");
    }
    
    function DtoS (uint pDias) public pure returns (uint){
    return (pDias * 24 * 60 * 60);
    }

    function StoD (uint pSegundos) public pure returns (uint){
    return (pSegundos / 60 / 60 / 24);
    }
    
}
