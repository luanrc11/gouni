const mysql      = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  port     : 3306,
  user     : 'root',
  password : '123456',
  database : 'gouni'
});

connection.connect(function(err){
    if(err) 
        return console.log("Erro ao conectar no banco de dados", err);
    console.log('Conexão com o banco realizada com sucesso');
  })