--Queries do Desafio

--1. SELECT simples
SELECT * 
FROM cliente;

--2. Qual veículo pertence ao cliente João
SELECT 
      v.modelo
      , c.nome
FROM veiculo v
JOIN cliente c ON v.idCliente = c.idCliente
WHERE c.nome = 'João Silva';

--3. Atributo Derivado (valor total da ordem)
SELECT 
    o.idOrdem,
    SUM(s.valor + (p.valor * osi.quantidade)) AS valor_total
FROM ordem_servico o
JOIN ordem_servico_item osi ON o.idOrdem     = osi.idOrdem
JOIN servico s              ON osi.idServico = s.idServico
JOIN peca p                 ON osi.idPeca    = p.idPeca
GROUP BY o.idOrdem;

--4. ORDER BY
SELECT * FROM servico
ORDER BY valor DESC;

--5. Qual cliente possui mais de 1 ordem
SELECT 
      c.nome, 
      COUNT(o.idOrdem) AS total_ordens
FROM cliente c
JOIN veiculo v       ON c.idCliente = v.idCliente
JOIN ordem_servico o ON v.idVeiculo = o.idVeiculo
GROUP BY c.nome
HAVING COUNT(o.idOrdem) > 1;

--6. Lista completa da ordem
SELECT 
    c.nome      AS cliente,
    v.modelo    AS veiculo,
    m.nome      AS mecanico,
    s.descricao AS servico,
    p.descricao AS peca
FROM ordem_servico o
JOIN veiculo v              ON o.idVeiculo   = v.idVeiculo
JOIN cliente c              ON v.idCliente   = c.idCliente
JOIN mecanico m             ON o.idMecanico  = m.idMecanico
JOIN ordem_servico_item osi ON o.idOrdem     = osi.idOrdem
JOIN servico s              ON osi.idServico = s.idServico
JOIN peca p                 ON osi.idPeca    = p.idPeca;
