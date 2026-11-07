CREATE DATABASE AnaliseOptica;
GO
USE AnaliseOptica;
GO

-- Tabela Cliente
CREATE TABLE Cliente (
    NomeCliente NVARCHAR(100) NOT NULL,
    CPF         VARCHAR(11)   NOT NULL,
    Tel         NVARCHAR(20)  NOT NULL,
    Email       NVARCHAR(100) NOT NULL,
    Cep         NVARCHAR(15)  NOT NULL,
    Job         NVARCHAR(100) NOT NULL,
    IdCliente   INT IDENTITY(100,1) PRIMARY KEY NOT NULL
);
GO

-- Tabela Vendedor
CREATE TABLE Vendedor (
    Nome       NVARCHAR(50) NOT NULL,
    IdVendedor NVARCHAR(15) PRIMARY KEY NOT NULL
);
GO

-- Tabela Venda
CREATE TABLE Venda (
    IdVenda      INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdCliente    INT NOT NULL,
    IdVendedor   NVARCHAR(15) NOT NULL,
    Lente        VARCHAR(255) NULL,
    Preço        MONEY NULL,
    DataCompra   DATE NULL,
    DataCadastro DATE NULL,
    Pagamento    VARCHAR(255) NULL
);
GO

-- Chaves estrangeiras da Venda
ALTER TABLE Venda
ADD FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente);

ALTER TABLE Venda
ADD FOREIGN KEY (IdVendedor) REFERENCES Vendedor(IdVendedor);
GO

-- Tabela Cash_Back
CREATE TABLE Cash_Back (
    Beneficio  DECIMAL(10,2) NOT NULL,
    CodResgate NCHAR(4)      NOT NULL,
    IdVenda    INT           NOT NULL
);
GO

-- Chave estrangeira do Cash_Back
ALTER TABLE Cash_Back
ADD FOREIGN KEY (IdVenda) REFERENCES Venda(IdVenda);
GO