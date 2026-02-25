
-- Cliente
INSERT INTO cliente (nome, telefone)
VALUES ('João Silva', '99999-1111'),
       ('Maria Souza', '98888-2222');

-- Veículo
INSERT INTO veiculo (placa, modelo, idCliente)
VALUES ('ABC1234', 'Gol', 1),
       ('XYZ9876', 'Civic', 2);

-- Mecânico
INSERT INTO mecanico (nome, especialidade)
VALUES ('Carlos', 'Motor'),
       ('Pedro', 'Freios');

-- Serviço
INSERT INTO servico (descricao, valor)
VALUES ('Troca de óleo', 150),
       ('Alinhamento', 100);

-- Peça
INSERT INTO peca (descricao, valor)
VALUES ('Filtro de óleo', 50),
       ('Pastilha de freio', 200);

-- Ordem de Serviço
INSERT INTO ordem_servico (data_abertura, status, idVeiculo, idMecanico)
VALUES ('2026-02-20', 'Aberta', 1, 1);

-- Itens
INSERT INTO ordem_servico_item
VALUES (1,1,1,1),
       (1,2,2,2);
