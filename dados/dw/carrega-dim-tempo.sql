# Carrega a tabela dim_tempo

INSERT INTO DW.dim_tempo (ano, mes, dia, data_completa)
SELECT EXTRACT(YEAR FROM d)::INT, 
       EXTRACT(MONTH FROM d)::INT, 
       EXTRACT(DAY FROM d)::INT, d::DATE
FROM generate_series('2020-01-01'::DATE, '2024-12-31'::DATE, '1 day'::INTERVAL) d;