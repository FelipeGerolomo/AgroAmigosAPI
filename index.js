const express = require('express');
const app = express();
const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const cors = require('cors');
const cron = require("node-cron");
const bodyParser = require('body-parser');
const cheerio = require('cheerio');
var moment = require('moment');
var request = require('request').defaults({ rejectUnauthorized: false });
const config = require('./config')
moment().format();
app.use(cors());
const tokenList = {};
// process.env.SECRET_KEY = 'agroamigos';

app.use(bodyParser.json());

var tempo = { now: null, h72: null, d15: null };

const connection = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'admin',
    password: '@Unicesumar2018',
    database: 'agroamigos',
    port: 3306,
    debug: false,
    multipleStatements: true
});

gerar();

cron.schedule("00 17 * * *", function () {
    console.log("---------------------");
    console.log("Running Cron Job");
    gerar();
});

// const connection = mysql.createPool({
//     connectionLimit: 100,
//     host: 'localhost',
//     user: 'root',
//     password: 'root',
//     database: 'agroamigos',
//     port: 3306,
//     debug: false,
//     multipleStatements: true
// });

app.get('/estados', function (req, res) {
    request.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados', function (error, response, body) {
        res.send(JSON.parse(body));
    });
});

app.get('/estado/:uf', function (req, res) {
    const uf = req.params.uf;
    console.log(uf)
    request.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/' + uf + '/municipios', function (error, response, body) {
        res.send(JSON.parse(body));
    });
});

app.get('/produtos', function (req, res) {
    connection.getConnection(function (err, connection) {
        if (err) {
            res.status(500).json(err);
        } else {
            connection.query('select * from produtos;', function (err, rows, fields) {
                if (!err) {
                    res.status(200).json(rows);
                } else {
                    res.status(500).json(err);
                }
            });
            connection.release();
        }
    });
});

app.post('/register', function (req, res) {
    console.log(req.body)
    const appData = {
        'error': 1,
        'data': ''
    };


    const userData = {
        "EMAIL": req.body.email,
        "SENHA": req.body.senha,
        "NOME": req.body.nome,
        "UF": req.body.uf,
        "CIDADE": req.body.cidade,
        "TELEFONE": req.body.telefone
    }

    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = 1;
            appData['data'] = 'Internal Server Error';
            res.status(500).json(appData);
        } else {
            connection.query('INSERT INTO user SET ?', userData, function (err, rows, fields) {
                if (!err) {
                    const response = {
                        "status": "OK",
                    }
                    res.status(200).json(response);
                } else {
                    const response = {
                        "error": err,
                        "status": "FAIL",
                    }
                    res.status(400).json(response);
                }
            });
            connection.release();
        }
    });
});

app.post('/login', (req, res) => {
    const postData = req.body;
    console.log(postData)
    const user = {
        "email": postData.email,
        "senha": postData.senha
    }
    var appData = {};
    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = 1;
            appData['data'] = err;
            res.status(500).json(appData);
        } else {
            connection.query('SELECT * FROM user WHERE EMAIL = ?', [user['email']], function (err, rows, fields) {
                if (err) {
                    appData.error = 1;
                    appData['data'] = 'Error Occured!';
                    res.status(400).json(appData);
                } else {
                    if (rows.length > 0) {
                        console.log(rows)
                        if (rows[0].SENHA == user.senha) {
                            const token = jwt.sign(user, config.secret, { expiresIn: config.tokenLife })
                            const refreshToken = jwt.sign(user, config.refreshTokenSecret, { expiresIn: config.refreshTokenLife })
                            const response = {
                                "id_user": rows[0]["ID_USER"],
                                "cidade": rows[0]["CIDADE"],
                                "uf": rows[0]["UF"],
                                "status": "OK",
                                "token": token,
                                "refreshToken": refreshToken,
                            }
                            tokenList[refreshToken] = response
                            res.status(200).json(response);
                        } else {
                            appData.error = 1;
                            appData['data'] = 'Email and Password does not match';
                            res.status(204).json(appData);
                        }
                    } else {
                        const response = {
                            "status": "FAIL",
                        }
                        res.status(200).json(response);
                    }
                }
            });
            connection.release();
        }
    });
    // do the database authentication here, with user name and password combination.
})

app.get('atualizarCotacoes', function (req, res, next) {
    request.get('http://www.cepea.esalq.usp.br/br/widgetproduto.js.php?fonte=arial&tamanho=10&largura=400px&corfundo=dbd6b2&cortexto=333333&corlinha=ede7bf&id_indicador%5B%5D=50&id_indicador%5B%5D=149&id_indicador%5B%5D=35&id_indicador%5B%5D=143&id_indicador%5B%5D=53&id_indicador%5B%5D=54&id_indicador%5B%5D=91&id_indicador%5B%5D=8&id_indicador%5B%5D=3&id_indicador%5B%5D=2&id_indicador%5B%5D=23&id_indicador%5B%5D=24&id_indicador%5B%5D=162&id_indicador%5B%5D=101&id_indicador%5B%5D=208&id_indicador%5B%5D=76&id_indicador%5B%5D=104&id_indicador%5B%5D=209&id_indicador%5B%5D=119&id_indicador%5B%5D=75&id_indicador%5B%5D=100&id_indicador%5B%5D=103&id_indicador%5B%5D=181&id_indicador%5B%5D=130&id_indicador%5B%5D=leite&id_indicador%5B%5D=72&id_indicador%5B%5D=77&id_indicador%5B%5D=305-BA&id_indicador%5B%5D=305-CE&id_indicador%5B%5D=305-MS&id_indicador%5B%5D=305-MT&id_indicador%5B%5D=305-PR&id_indicador%5B%5D=305-RS&id_indicador%5B%5D=305-SP&id_indicador%5B%5D=159&id_indicador%5B%5D=12&id_indicador%5B%5D=92&id_indicador%5B%5D=129-10&id_indicador%5B%5D=129-6&id_indicador%5B%5D=129-4&id_indicador%5B%5D=129-5&id_indicador%5B%5D=129-1&id_indicador%5B%5D=124&id_indicador%5B%5D=178&id_indicador%5B%5D=179', function (error, response, body) {
        console.log('error:', error);
        extractCotacoes(body, res);
    });
});

app.post('/token', (req, res) => {
    // refresh the damn token
    const postData = req.body
    // if refresh token exists
    if ((postData.refreshToken) && (postData.refreshToken in tokenList)) {
        const user = {
            "email": postData.email,
            "senha": postData.senha
        }
        const token = jwt.sign(user, config.secret, { expiresIn: config.tokenLife })
        const response = {
            "token": token,
        }
        // update the token in the list
        tokenList[postData.refreshToken].token = token
        res.status(200).json(response);
    } else {
        res.status(404).send('Invalid request')
    }
})

app.use(require('./tokenChecker'))

app.get('/secure', (req, res) => {
    // all secured routes goes here
    res.send('I am secured...')
});

app.post('/grafico/produtos', function (req, res) {
    const idProdutos = req.body;
    connection.getConnection(function (err, connection) {
        if (err) {
            res.status(500).json(err);
        } else {
            connection.query('select * from cotacoes where COD_PRODUTO in (?)', [idProdutos], function (err, rows, fields) {
                if (!err) {
                    res.status(200).json(rows);
                } else {
                    res.status(500).json(err);
                }
            });
            connection.release();
        }
    });
});

app.get('/config/:user', function (req, res) {
    const user = req.params.user;
    connection.getConnection(function (err, connection) {
        if (err) {
            res.status(500).json(err);
        } else {
            connection.query('select * from user_config where COD_USER = ' + user + '', function (err, rows, fields) {
                if (!err) {
                    console.log(rows)
                    res.status(200).json(rows);
                } else {
                    res.status(500).json(err);
                }
            });
            connection.release();
        }
    });
});

app.get('/noticias', function (req, res) {
    request.get('https://api.cognitive.microsoft.com/bing/v7.0/news/search?q=agronegocio&originalImg=true&freshness=week', { headers: { 'Ocp-Apim-Subscription-Key': 'dfadc1af341143a29cb7cd0c81702def' } }, function (error, response, body) {
        res.send(body)
        console.log(body)
    });
});

var token1 = '59dfd2d8568a23a0818dbedb70d7c3dc'
var token2 = '3f0374415e504cd012951020ad5d6bcb'
app.post('/tempo', function (req, res) {
    const tempoData = req.body;
    console.log(tempoData)

    let uf = getSiglaEstado(tempoData.uf)
    let cidade = tempoData.cidade
    console.log(uf, cidade)
    let url = 'http://apiadvisor.climatempo.com.br/api/v1/locale/city?name=' + cidade + '&state=' + uf + '&token=' + token1
    url = encodeURI(url)
    request.get(url, function (error, response, body) {
        var idCidade = JSON.parse(body);
        idCidade = idCidade[0]['id'];
        getForecast72(idCidade, res)
        console.log(idCidade)
    });
});

function getForecast72(city, res) {
    let url = 'http://apiadvisor.climatempo.com.br/api/v1/forecast/locale/' + city + '/hours/72?token=' + token1
    request.get(url, function (error, response, body) {
        tempo.h72 = JSON.parse(body);
        getForecastNow(city, res);
    });
}

function getForecastNow(city, res) {
    let url = 'http://apiadvisor.climatempo.com.br/api/v1/weather/locale/' + city + '/current?token=' + token1
    request.get(url, function (error, response, body) {
        tempo.now = JSON.parse(body);
        getForecast15Day(city, res);
    });
}

function getForecast15Day(city, res) {
    let url = 'http://apiadvisor.climatempo.com.br/api/v1/forecast/locale/' + city + '/days/15?token=' + token1
    request.get(url, function (error, response, body) {
        tempo.d15 = JSON.parse(body);;
        res.send(tempo)
    });
}


app.get('/gerar', function (req, res) {
    request.get('http://www.cepea.esalq.usp.br/br/widgetproduto.js.php?fonte=arial&tamanho=10&largura=400px&corfundo=dbd6b2&cortexto=333333&corlinha=ede7bf&id_indicador%5B%5D=50&id_indicador%5B%5D=149&id_indicador%5B%5D=35&id_indicador%5B%5D=143&id_indicador%5B%5D=53&id_indicador%5B%5D=54&id_indicador%5B%5D=91&id_indicador%5B%5D=8&id_indicador%5B%5D=3&id_indicador%5B%5D=2&id_indicador%5B%5D=23&id_indicador%5B%5D=24&id_indicador%5B%5D=162&id_indicador%5B%5D=101&id_indicador%5B%5D=208&id_indicador%5B%5D=76&id_indicador%5B%5D=104&id_indicador%5B%5D=209&id_indicador%5B%5D=119&id_indicador%5B%5D=75&id_indicador%5B%5D=100&id_indicador%5B%5D=103&id_indicador%5B%5D=181&id_indicador%5B%5D=130&id_indicador%5B%5D=leite&id_indicador%5B%5D=72&id_indicador%5B%5D=77&id_indicador%5B%5D=305-BA&id_indicador%5B%5D=305-CE&id_indicador%5B%5D=305-MS&id_indicador%5B%5D=305-MT&id_indicador%5B%5D=305-PR&id_indicador%5B%5D=305-RS&id_indicador%5B%5D=305-SP&id_indicador%5B%5D=159&id_indicador%5B%5D=12&id_indicador%5B%5D=92&id_indicador%5B%5D=129-10&id_indicador%5B%5D=129-6&id_indicador%5B%5D=129-4&id_indicador%5B%5D=129-5&id_indicador%5B%5D=129-1&id_indicador%5B%5D=124&id_indicador%5B%5D=178&id_indicador%5B%5D=179', function (error, response, body) {
        console.log('error:', error);
        extractCotacoes(body);
    });
});

function gerar() {
    request.get('http://www.cepea.esalq.usp.br/br/widgetproduto.js.php?fonte=arial&tamanho=10&largura=400px&corfundo=dbd6b2&cortexto=333333&corlinha=ede7bf&id_indicador%5B%5D=50&id_indicador%5B%5D=149&id_indicador%5B%5D=35&id_indicador%5B%5D=143&id_indicador%5B%5D=53&id_indicador%5B%5D=54&id_indicador%5B%5D=91&id_indicador%5B%5D=8&id_indicador%5B%5D=3&id_indicador%5B%5D=2&id_indicador%5B%5D=23&id_indicador%5B%5D=24&id_indicador%5B%5D=162&id_indicador%5B%5D=101&id_indicador%5B%5D=208&id_indicador%5B%5D=76&id_indicador%5B%5D=104&id_indicador%5B%5D=209&id_indicador%5B%5D=119&id_indicador%5B%5D=75&id_indicador%5B%5D=100&id_indicador%5B%5D=103&id_indicador%5B%5D=181&id_indicador%5B%5D=130&id_indicador%5B%5D=leite&id_indicador%5B%5D=72&id_indicador%5B%5D=77&id_indicador%5B%5D=305-BA&id_indicador%5B%5D=305-CE&id_indicador%5B%5D=305-MS&id_indicador%5B%5D=305-MT&id_indicador%5B%5D=305-PR&id_indicador%5B%5D=305-RS&id_indicador%5B%5D=305-SP&id_indicador%5B%5D=159&id_indicador%5B%5D=12&id_indicador%5B%5D=92&id_indicador%5B%5D=129-10&id_indicador%5B%5D=129-6&id_indicador%5B%5D=129-4&id_indicador%5B%5D=129-5&id_indicador%5B%5D=129-1&id_indicador%5B%5D=124&id_indicador%5B%5D=178&id_indicador%5B%5D=179', function (error, response, body) {
        console.log('error:', error);
        extractCotacoes(body);
    });
}

function extractCotacoes(html) {
    const $ = cheerio.load(html);
    const cotacoes = [];
    let data;
    let produto;
    let preco;
    let unidade;
    $('tbody tr').each(function (i, elem) {
        data = $(this).children('td').first().text();
        if (moment(data, ["DD-MM-YYYY"]).isValid()) {
            data = moment(data, "DD-MM-YYYY").format("YYYY-MM-DD");
        } else {
            data = moment(data, "MM-YYYY").format("YYYY-MM-DD");
        }
        produto = $(this).children('td').children('.maior').eq(0).text();
        preco = $(this).children('td').last().text();
        unidade = $(this).children('td').children('.unidade').text();

        cotacoes[i] = [
            produto,
            preco,
            unidade,
            data,
        ]
    });
    saveCotacoes(cotacoes);
}

function saveCotacoes(cotacoes) {
    const appData = {
        'error': 1,
        'data': ''
    };
    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = 1;
            appData['data'] = 'Internal Server Error';
            //res.status(500).json(appData);
        } else {
            connection.query('INSERT IGNORE INTO AUX_COTACOES (DC_PRODUTO,DC_PRECO,DC_UNIDADE,DT_DATA) VALUES ?', [cotacoes], function (err, rows, fields) {
                if (!err) {
                    appData.error = 0;
                    appData['data'] = 'User registered successfully!';
                    //res.status(201).json(appData);
                } else {
                    appData['data'] = 'Error Occured!';
                    //res.status(400).json(err);
                }
            });
            connection.release();
        }
    });
}

app.post('/config', (req, res) => {
    const userConfig = req.body;

    const appData = {
        'error': 1,
        'data': ''
    };

    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = 1;
            appData['data'] = 'Internal Server Error';
            res.status(500).json(appData);
        } else {
            connection.query('INSERT IGNORE INTO user_config (COD_USER, COD_PRODUTO) VALUES ?', [userConfig], function (err, rows, fields) {
                if (!err) {
                    const response = {
                        "status": "OK",
                    }
                    res.status(200).json(response);
                } else {
                    const response = {
                        "error": err,
                        "status": "FAIL",
                    }
                    res.status(400).json(response);
                }
            });
            connection.release();
        }
    });
})

app.get('/cotacoes/user/:id', (req, res) => {
    console.log("cotacoes")
    const userId = req.params.id;
    const sql = 'SELECT user_config.COD_PRODUTO, cotacoes.DC_PRODUTO,cotacoes.DC_PRECO,cotacoes.DC_UNIDADE,max(cotacoes.DT_DATA) as DT_DATA FROM user_config INNER JOIN cotacoes ON user_config.COD_PRODUTO = cotacoes.COD_PRODUTO WHERE user_config.COD_USER = ? group by cotacoes.DC_PRODUTO;'
    console.log(sql)
    const appData = {
        'error': 1,
        'data': ''
    };
    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = err;
            appData['data'] = 'Internal Server Error';
            res.status(500).json(appData);
        } else {
            connection.query(sql, userId, function (err, rows, fields) {
                if (!err) {
                    res.send(rows)
                } else {
                    appData['error'] = true;
                    appData['data'] = err;
                    res.status(400).json(appData);
                }
            });
            connection.release();
        }
    });
})

app.get('/config/user/:id', (req, res) => {
    console.log("cotacoes")
    const userId = req.params.id;
    const sql = 'select * from user_config where COD_USER = ?'
    console.log(sql)
    const appData = {
        'error': 1,
        'data': ''
    };
    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = err;
            appData['data'] = 'Internal Server Error';
            res.status(500).json(appData);
        } else {
            connection.query(sql, userId, function (err, rows, fields) {
                if (!err) {
                    res.send(rows)
                } else {
                    appData['error'] = true;
                    appData['data'] = err;
                    res.status(400).json(appData);
                }
            });
            connection.release();
        }
    });
})

app.delete('/config/user/:id', (req, res) => {
    console.log("cotacoes")
    const userId = req.params.id;
    const sql = 'DELETE FROM user_config where COD_USER = ?'
    console.log(sql)
    const appData = {
        'error': 1,
        'data': ''
    };
    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = err;
            appData['data'] = 'Internal Server Error';
            res.status(500).json(appData);
        } else {
            connection.query(sql, userId, function (err, rows, fields) {
                if (!err) {
                    const response = {
                        "status": "OK",
                    }
                    res.status(200).json(response);
                } else {
                    appData['error'] = true;
                    appData['data'] = err;
                    res.status(400).json(appData);
                }
            });
            connection.release();
        }
    });
})

app.put('/localizacao/user/', (req, res) => {
    const putLocalizacao = req.body;
    const user = {
        "id": putLocalizacao.id,
        "uf": putLocalizacao.uf,
        "cidade": putLocalizacao.cidade
    }
    const sql = 'UPDATE user SET UF = "' + user.uf + '", CIDADE = "' + user.cidade + '" WHERE ID_USER = "' + user.id + '"';
    console.log(sql)
    const appData = {
        'error': 1,
        'data': ''
    };
    connection.getConnection(function (err, connection) {
        if (err) {
            appData['error'] = err;
            appData['data'] = 'Internal Server Error';
            res.status(500).json(appData);
        } else {
            connection.query(sql, function (err, rows, fields) {
                if (!err) {
                    const response = {
                        "status": "OK",
                    }
                    res.status(200).json(response);
                } else {
                    appData['error'] = true;
                    appData['data'] = err;
                    res.status(400).json(appData);
                }
            });
            connection.release();
        }
    });
})

function getSiglaEstado(uf) {
    var data;
    switch (uf.toUpperCase()) {
        case "ACRE": data = "AC"; break;
        case "ALAGOAS": data = "AL"; break;
        case "AMAZONAS": data = "AM"; break;
        case "AMAPÁ": data = "AP"; break;
        case "BAHIA": data = "BA"; break;
        case "CEARÁ": data = "CE"; break;
        case "DISTRITO FEDERAL": data = "DF"; break;
        case "ESPÍRITO SANTO": data = "ES"; break;
        case "GOIÁS": data = "GO"; break;
        case "MARANHÃO": data = "MA"; break;
        case "MINAS GERAIS": data = "MG"; break;
        case "MATO GROSSO DO SUL": data = "MS"; break;
        case "MATO GROSSO": data = "MT"; break;
        case "PARÁ": data = "PA"; break;
        case "PARAÍBA": data = "PB"; break;
        case "PERNAMBUCO": data = "PE"; break;
        case "PIAUÍ": data = "PI"; break;
        case "PARANÁ": data = "PR"; break;
        case "RIO DE JANEIRO": data = "RJ"; break;
        case "RIO GRANDE DO NORTE": data = "RN"; break;
        case "RONDÔNIA": data = "RO"; break;
        case "RORAIMA": data = "RR"; break;
        case "RIO GRANDE DO SUL": data = "RS"; break;
        case "SANTA CATARINA": data = "SC"; break;
        case "SERGIPE": data = "SE"; break;
        case "SÃO PAULO": data = "SP"; break;
        case "TOCANTÍNS": data = "TO"; break;
    }
    return data;
};


app.listen(3000, function () {
    console.log('Listening on port 3000!');
});