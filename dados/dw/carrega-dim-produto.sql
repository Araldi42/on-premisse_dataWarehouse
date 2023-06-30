# Carrega a tabela dim_produto no DW a partir da Staging Area

INSERT INTO DW.dim_produto (id_produto, nome_produto, categoria, subcategoria)
SELECT id_produto, 
       nome_produto, 
       nome_categoria, 
       nome_subcategoria
FROM staginarea.st_ft_produtos tb1, staginarea.st_ft_subcategorias tb2, staginarea.st_ft_categorias tb3
WHERE tb3.id_categoria = tb2.id_categoria
AND tb2.id_subcategoria = tb1.id_subcategoria;