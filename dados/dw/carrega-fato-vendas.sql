# Carrega a tabela fato_vendas

INSERT INTO DW.fato_vendas (sk_produto, 
	                            sk_cliente, 
	                            sk_localidade, 
	                            sk_tempo, 
	                            quantidade, 
	                            preco_venda, 
	                            custo_produto, 
	                            receita_vendas)
SELECT sk_produto,
	  sk_cliente,
	  sk_localidade,
       sk_tempo, 
       SUM(quantidade) AS quantidade, 
       SUM(preco_venda) AS preco_venda, 
	  SUM(custo_produto) AS custo_produto, 
	  SUM(ROUND((CAST(quantidade AS numeric) * CAST(preco_venda AS numeric)), 2)) AS receita_vendas
FROM staginarea.st_ft_vendas tb1, 
     staginarea.st_ft_clientes tb2, 
	staginarea.st_ft_localidades tb3, 
	staginarea.st_ft_produtos tb4,
	DW.dim_tempo tb5,
	DW.dim_produto tb6,
	DW.dim_localidade tb7,
	DW.dim_cliente tb8
WHERE tb2.id_cliente = tb1.id_cliente
AND tb3.id_localidade = tb1.id_localizacao
AND tb4.id_produto = tb1.id_produto
AND tb1.data_transacao = tb5.data_completa
AND tb2.id_cliente = tb8.id_cliente
AND tb3.id_localidade = tb7.id_localidade
AND tb4.id_produto = tb6.id_produto
GROUP BY sk_produto, sk_cliente, sk_localidade, sk_tempo;

