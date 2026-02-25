
--Cliente
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome      VARCHAR(100) NOT NULL,
    telefone  VARCHAR(20)
);

--Veículo
CREATE TABLE veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa     VARCHAR(10) UNIQUE NOT NULL,
    modelo    VARCHAR(50),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

--Mecânico
CREATE TABLE mecanico (
    idMecanico    INT AUTO_INCREMENT PRIMARY KEY,
    nome          VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

--Ordem de Serviço
CREATE TABLE ordem_servico (
    idOrdem       INT AUTO_INCREMENT PRIMARY KEY,
    data_abertura DATE,
    status        VARCHAR(50),
    idVeiculo     INT,
    idMecanico    INT,
    FOREIGN KEY (idVeiculo) REFERENCES veiculo(idVeiculo),
    FOREIGN KEY (idMecanico) REFERENCES mecanico(idMecanico)
);

--Serviço
CREATE TABLE servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    valor     FLOAT
);

--Peça
CREATE TABLE peca (
    idPeca    INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    valor     FLOAT
);

--Itens da Ordem (Serviços e Peças)
CREATE TABLE ordem_servico_item (
    idOrdem    INT,
    idServico  INT,
    idPeca     INT,
    quantidade INT,
    PRIMARY KEY (idOrdem, idServico, idPeca),
    FOREIGN KEY (idOrdem) REFERENCES ordem_servico(idOrdem),
    FOREIGN KEY (idServico) REFERENCES servico(idServico),
    FOREIGN KEY (idPeca) REFERENCES peca(idPeca)
);
