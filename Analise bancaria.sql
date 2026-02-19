select * 
from clientes 
order by idade desc;

select distinct tipo_conta
from contas;

select tipo_transacao, valor, data_transacao
from transacoes
order by data_transacao desc;

select tipo_transacao, valor, data_transacao
from transacoes
where valor > 3000 and tipo_transacao = 'Deposito';

select clientes.nome, contas.tipo_conta, contas.saldo
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente;

select clientes.nome, transacoes.tipo_transacao, transacoes.valor, transacoes.data_transacao
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta;

select clientes.nome, sum (transacoes.valor) as total_movimentacao
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by clientes.nome;

select clientes.nome, count (transacoes.valor) as quantidade_movimentada
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by clientes.nome;

select transacoes.tipo_transacao, sum (transacoes.valor) as Total
from contas
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by transacoes.tipo_transacao;

select clientes.nome, sum (transacoes.valor) as total_movimentacao
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by clientes.nome
having sum (transacoes.valor) > 5000;

select clientes.nome, count (transacoes.valor) as quantidade_movimentada
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by clientes.nome
having count (transacoes.valor) > 2;

select clientes.nome, contas.saldo,
case
	when contas.saldo > 15000 then 'Alta Renda'
	when contas.saldo between 5000 and 15000 then 'Média Renda'
	else 'Baixa Renda' 
end as Classificacao_saldo
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente;

select clientes.nome, sum (transacoes.valor) as total_movimentacao,
case
	when sum (transacoes.valor) > 10000 then 'Cliente VIP'
	when sum (transacoes.valor) between 5000 and 10000 then 'Cliente Ativo'
	else 'Cliente Comum'
end as classificacao_cliente
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by clientes.nome;

select clientes.nome, contas.saldo
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
where contas.saldo > (select avg (contas.saldo) as total 
from contas);

select clientes.nome, sum (transacoes.valor) as total_movimentacao
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by clientes.nome
having sum (transacoes.valor) > (select avg(total)
    from (
        select clientes.nome, sum (transacoes.valor) as total
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
group by clientes.nome
    ) as sub
);

select clientes.nome, transacoes.valor
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
inner join transacoes
on contas.id_conta = transacoes.id_conta
where transacoes.valor = (select max (transacoes.valor)
from transacoes);

select clientes.nome, clientes.idade, contas.saldo
from clientes
inner join contas
on clientes.id_cliente = contas.id_cliente
group by clientes.nome, contas.saldo, clientes.idade 
having contas.saldo > (select avg (contas.saldo) as total 
from contas) and clientes.idade > (select avg (clientes.idade ) as total 
from clientes);