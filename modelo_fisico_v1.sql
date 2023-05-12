-- Tabela Dimensão Tempo
CREATE TABLE dim_tempo (
  id_tempo INT PRIMARY KEY AUTO_INCREMENT,
  ano INT NOT NULL,
  mes INT NOT NULL,
  dia INT NOT NULL
);

-- Tabela Dimensão Produto
CREATE TABLE dim_produto (
  id_produto INT PRIMARY KEY AUTO_INCREMENT,
  nome_produto VARCHAR(50) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  subcategoria VARCHAR(50) NOT NULL
);

-- Tabela Dimensão Localização
CREATE TABLE dim_localizacao (
  id_localizacao INT PRIMARY KEY AUTO_INCREMENT,
  pais VARCHAR(50) NOT NULL,
  regiao VARCHAR(50) NOT NULL,
  estado VARCHAR(50) NOT NULL,
  cidade VARCHAR(50) NOT NULL
);

-- Tabela Dimensão Cliente
CREATE TABLE dim_cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  tipo VARCHAR(50) NOT NULL
);

-- Tabela Fato de Vendas
CREATE TABLE fato_vendas (
  id_produto INT NOT NULL,
  id_cliente INT NOT NULL,
  id_localizacao INT NOT NULL,
  id_tempo INT NOT NULL,
  quantidade INT NOT NULL,
  preco_venda DECIMAL(10,2) NOT NULL,
  custo_produto DECIMAL(10,2) NOT NULL,
  receita_vendas DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id_produto, id_cliente, id_localizacao, id_tempo),
  FOREIGN KEY (id_produto) REFERENCES dim_produto (id_produto),
  FOREIGN KEY (id_cliente) REFERENCES dim_cliente (id_cliente),
  FOREIGN KEY (id_localizacao) REFERENCES dim_localizacao (id_localizacao),
  FOREIGN KEY (id_tempo) REFERENCES dim_tempo (id_tempo)
);
