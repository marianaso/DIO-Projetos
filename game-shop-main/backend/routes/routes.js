module.exports = server => {

    const connection = require('../database/connection');
    
    server.get('/', (require, response) => {
        response.json({message: 'Bem vindo a nossa loja de games'})
    })

    server.get('/pedidos', (require, response) => {
        const sql = 'SELECT pedidos.id_pedido, clientes.nome_cliente, pedidos.quantidade, games.nome_game, games.preco, categorias.nome FROM pedidos JOIN clientes ON pedidos.fk_idcliente = clientes.id_cliente JOIN games ON pedidos.fk_idgames = games.id JOIN categorias ON games.fk_idcategora = categorias.id_categoria ORDER BY games.nome_game';
        connection.query(sql, (error, res) => {
            if (error){
                return error;
            } console.log("games: ", res);
            response.json(res)
        })
    })
};
