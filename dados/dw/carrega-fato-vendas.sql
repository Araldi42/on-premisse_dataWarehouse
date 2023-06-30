# Carrega a tabela fato_vendas

INSERT INTO schema3.fato_vendas (sk_produto, 
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
FROM schema2.st_ft_vendas tb1, 
     schema2.st_ft_clientes tb2, 
	schema2.st_ft_localidades tb3, 
	schema2.st_ft_produtos tb4,
	schema3.dim_tempo tb5,
	schema3.dim_produto tb6,
	schema3.dim_localidade tb7,
	schema3.dim_cliente tb8
WHERE tb2.id_cliente = tb1.id_cliente
AND tb3.id_localidade = tb1.id_localizacao
AND tb4.id_produto = tb1.id_produto
AND tb1.data_transacao = tb5.data_completa
AND tb2.id_cliente = tb8.id_cliente
AND tb3.id_localidade = tb7.id_localidade
AND tb4.id_produto = tb6.id_produto
GROUP BY sk_produto, sk_cliente, sk_localidade, sk_tempo;

