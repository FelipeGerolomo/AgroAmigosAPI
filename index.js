const express = require('express');
const app = express();
const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const cors = require('cors')
const bodyParser = require('body-parser');
const cheerio = require('cheerio');
var moment = require('moment');
var request = require('request').defaults({ rejectUnauthorized: false });
moment().format();
app.use(cors());

process.env.SECRET_KEY = 'agroamigos';

app.use(bodyParser.urlencoded({
    extended: true
}));

const connection = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'agroamigos',
    port: 3306,
    debug: false,
    multipleStatements: true
});



app.get('api/atualizarCotacoes', function (req, res, next) {
    request.get('http://www.cepea.esalq.usp.br/br/widgetproduto.js.php?fonte=arial&tamanho=10&largura=400px&corfundo=dbd6b2&cortexto=333333&corlinha=ede7bf&id_indicador%5B%5D=50&id_indicador%5B%5D=149&id_indicador%5B%5D=35&id_indicador%5B%5D=143&id_indicador%5B%5D=53&id_indicador%5B%5D=54&id_indicador%5B%5D=91&id_indicador%5B%5D=8&id_indicador%5B%5D=3&id_indicador%5B%5D=2&id_indicador%5B%5D=23&id_indicador%5B%5D=24&id_indicador%5B%5D=162&id_indicador%5B%5D=101&id_indicador%5B%5D=208&id_indicador%5B%5D=76&id_indicador%5B%5D=104&id_indicador%5B%5D=209&id_indicador%5B%5D=119&id_indicador%5B%5D=75&id_indicador%5B%5D=100&id_indicador%5B%5D=103&id_indicador%5B%5D=181&id_indicador%5B%5D=130&id_indicador%5B%5D=leite&id_indicador%5B%5D=72&id_indicador%5B%5D=77&id_indicador%5B%5D=305-BA&id_indicador%5B%5D=305-CE&id_indicador%5B%5D=305-MS&id_indicador%5B%5D=305-MT&id_indicador%5B%5D=305-PR&id_indicador%5B%5D=305-RS&id_indicador%5B%5D=305-SP&id_indicador%5B%5D=159&id_indicador%5B%5D=12&id_indicador%5B%5D=92&id_indicador%5B%5D=129-10&id_indicador%5B%5D=129-6&id_indicador%5B%5D=129-4&id_indicador%5B%5D=129-5&id_indicador%5B%5D=129-1&id_indicador%5B%5D=124&id_indicador%5B%5D=178&id_indicador%5B%5D=179', function (error, response, body) {
        console.log('error:', error);
        extractCotacoes(body, res);
    });
});

function extractCotacoes(html, res) {
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
    saveCotacoes(cotacoes, res);
}


function saveCotacoes(cotacoes, res) {
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
            connection.query('INSERT INTO AUX_COTACOES (DC_PRODUTO,DC_PRECO,DC_UNIDADE,DT_DATA) VALUES ?', [cotacoes], function (err, rows, fields) {
                if (!err) {
                    appData.error = 0;
                    appData['data'] = 'User registered successfully!';
                    res.status(201).json(appData);
                } else {
                    appData['data'] = 'Error Occured!';
                    res.status(400).json(err);
                }
            });
            connection.release();
        }
    });
}

app.get('/', function (req, res) {
    res.send('OK!');
});

app.listen(3000, function () {
    console.log('Listening on port 3000!');
});