SELECT
    user_config.COD_PRODUTO,
    cotacoes.DC_PRODUTO,
    cotacoes.DC_PRECO,
    cotacoes.DC_UNIDADE,
	max(cotacoes.DT_DATA) as DT_DATA 
FROM
    user_config
    INNER JOIN cotacoes ON user_config.COD_PRODUTO = cotacoes.COD_PRODUTO
WHERE
    user_config.COD_USER = 1 group by cotacoes.DC_PRODUTO;
    
    
    
    
    
    
select * from user;
    
    
    
