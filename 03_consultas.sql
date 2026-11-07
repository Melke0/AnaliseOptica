USE AnaliseOptica;
GO

-- 1. Venda com o nome do cliente
SELECT v.IdVenda, c.NomeCliente, v.Lente, v.[Preço]
FROM Venda v
INNER JOIN Cliente c ON v.IdCliente = c.IdCliente;

-- 2. Venda com o nome do vendedor
SELECT v.IdVenda, vd.Nome AS Vendedor, v.[Preço]
FROM Venda v
INNER JOIN Vendedor vd ON v.IdVendedor = vd.IdVendedor;

-- 3. Venda com cliente e vendedor
SELECT c.NomeCliente, vd.Nome AS Vendedor, v.Lente, v.[Preço]
FROM Venda v
INNER JOIN Cliente c   ON v.IdCliente  = c.IdCliente
INNER JOIN Vendedor vd ON v.IdVendedor = vd.IdVendedor;

-- 4. Vendas acima de 2000
SELECT c.NomeCliente, v.Lente, v.[Preço]
FROM Venda v
INNER JOIN Cliente c ON v.IdCliente = c.IdCliente
WHERE v.[Preço] > 2000;

-- 5. Total vendido por vendedor
SELECT vd.Nome AS Vendedor, COUNT(*) AS QtdVendas, SUM(v.[Preço]) AS TotalVendido
FROM Venda v
INNER JOIN Vendedor vd ON v.IdVendedor = vd.IdVendedor
GROUP BY vd.Nome
ORDER BY TotalVendido DESC;

-- 6. Cashback de cada cliente
SELECT c.NomeCliente, cb.CodResgate, cb.Beneficio
FROM Cash_Back cb
INNER JOIN Venda v   ON cb.IdVenda  = v.IdVenda
INNER JOIN Cliente c ON v.IdCliente = c.IdCliente;