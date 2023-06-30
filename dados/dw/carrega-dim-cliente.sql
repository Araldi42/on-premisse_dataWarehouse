# Carrega a tabela dim_cliente no DW a partir da Staging Area

INSERT INTO DW.dim_cliente (id_cliente, nome, tipo)
SELECT id_cliente, 
       nome_cliente, 
       nome_tipo
FROM staginarea.st_ft_clientes tb1, staginarea.st_ft_tipo_cliente tb2
WHERE tb2.id_tipo = tb1.id_tipo;