# Carrega a tabela dim_localidade no DW a partir da Staging Area

INSERT INTO DW.dim_localidade (id_localidade, pais, regiao, estado, cidade)
SELECT id_localidade, 
	   pais, 
	   regiao, 
	   CASE
	   	WHEN nome_cidade = 'Natal' THEN 'Rio Grande do Norte'
		WHEN nome_cidade = 'Rio de Janeiro' THEN 'Rio de Janeiro'
		WHEN nome_cidade = 'Belo Horizonte' THEN 'Minas Gerais'
		WHEN nome_cidade = 'Salvador' THEN 'Bahia'
		WHEN nome_cidade = 'Blumenau' THEN 'Santa Catarina'
		WHEN nome_cidade = 'Curitiba' THEN 'Paraná'
		WHEN nome_cidade = 'Fortaleza' THEN 'Ceará'
		WHEN nome_cidade = 'Recife' THEN 'Pernambuco'
		WHEN nome_cidade = 'Porto Alegre' THEN 'Rio Grande do Sul'
		WHEN nome_cidade = 'Manaus' THEN 'Amazonas'
	   END estado, 
	   nome_cidade
FROM staginarea.st_ft_localidades tb1, staginarea.st_ft_cidades tb2
WHERE tb2.id_cidade = tb1.id_cidade;