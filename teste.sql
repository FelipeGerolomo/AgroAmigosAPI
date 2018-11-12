SELECT
    user_config.COD_PRODUTO,
    cotacoes.COD_PRODUTO,
    cotacoes.DC_PRODUTO
FROM
    user_config
    INNER JOIN cotacoes ON user_config.COD_PRODUTO = cotacoes.COD_PRODUTO
WHERE
    user_config.COD_USER = 1;