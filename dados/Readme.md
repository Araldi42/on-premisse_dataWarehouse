A arquitetura proposta para o ETL foi desenvolvida em elaboração de dados via SQL (para simular o que seria um banco de dados transacional como fonte dos dados),
uma Stagin area com outro banco de dados para efetuar uma cópia via airbyte dos dados e então aplicar as transformações necessárias sem que atrapalhe o funcionamento
do banco transacional com cargas e transformações pesadas. E por último, o carregamento dos dados para o Data Warehouse, com os dados já transformados, aplicando os
devidos relacioamentos e checagem de regras e hierarquia para disponibilidade no banco OLAP. 
