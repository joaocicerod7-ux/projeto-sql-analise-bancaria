drop table if exists transacoes cascade;
drop table if exists contas cascade;
drop table if exists clientes cascade;

create table clientes (
    id_cliente integer primary key,
    nome varchar(100),
    idade integer,
    cidade varchar(100)
);

create table contas (
    id_conta integer primary key,
    id_cliente integer,
    tipo_conta varchar(50),
    saldo numeric(12,2),
    constraint fk_cliente
        foreign key (id_cliente)
        references clientes(id_cliente)
);

create table transacoes (
    id_transacao integer primary key,
    id_conta integer,
    tipo_transacao varchar(50), -- Deposito ou Saque
    valor numeric(10,2),
    data_transacao date,
    constraint fk_conta
        foreign key (id_conta)
        references contas(id_conta)
);

insert into clientes values
(1, 'Ana Souza', 28, 'São Paulo'),
(2, 'Carlos Lima', 40, 'Rio de Janeiro'),
(3, 'Mariana Alves', 35, 'Belo Horizonte'),
(4, 'Pedro Rocha', 22, 'Curitiba'),
(5, 'Juliana Mendes', 30, 'Salvador'),
(6, 'Bruno Silva', 45, 'Fortaleza'),
(7, 'Fernanda Costa', 29, 'Recife'),
(8, 'Lucas Martins', 33, 'Porto Alegre'),
(9, 'Camila Ferreira', 27, 'Brasília'),
(10, 'Rafael Gomes', 38, 'Manaus'),
(11, 'Patricia Nunes', 41, 'Florianópolis'),
(12, 'Thiago Ribeiro', 24, 'Goiânia'),
(13, 'Amanda Carvalho', 36, 'Natal'),
(14, 'Eduardo Barros', 50, 'Campinas'),
(15, 'Larissa Teixeira', 31, 'Vitória'),
(16, 'Gabriel Moraes', 26, 'São Luís'),
(17, 'Beatriz Santos', 34, 'João Pessoa'),
(18, 'Vinicius Almeida', 39, 'Maceió'),
(19, 'Renata Oliveira', 28, 'Aracaju'),
(20, 'Felipe Andrade', 44, 'Teresina'),
(21, 'Carolina Batista', 32, 'Campo Grande'),
(22, 'Daniel Costa', 37, 'Cuiabá'),
(23, 'Aline Rodrigues', 29, 'Palmas'),
(24, 'Marcelo Freitas', 48, 'Ribeirão Preto'),
(25, 'Natália Cardoso', 27, 'Uberlândia'),
(26, 'Ricardo Monteiro', 53, 'Sorocaba'),
(27, 'Isabela Duarte', 31, 'Londrina'),
(28, 'Leonardo Pires', 36, 'Joinville'),
(29, 'Tatiane Melo', 33, 'Niterói'),
(30, 'Fábio Correia', 42, 'Santos');


insert into contas values
(1, 1, 'Corrente', 5000.00),
(2, 2, 'Poupanca', 12000.00),
(3, 3, 'Corrente', 8000.00),
(4, 4, 'Corrente', 1500.00),
(5, 5, 'Poupanca', 20000.00),
(6, 6, 'Corrente', 3000.00),
(7, 7, 'Corrente', 9500.00),
(8, 8, 'Poupanca', 4000.00),
(9, 9, 'Corrente', 7200.00),
(10, 10, 'Corrente', 18000.00),
(11, 11, 'Poupanca', 25000.00),
(12, 12, 'Corrente', 2200.00),
(13, 13, 'Poupanca', 14000.00),
(14, 14, 'Corrente', 30000.00),
(15, 15, 'Corrente', 6700.00),
(16, 16, 'Corrente', 4100.00),
(17, 17, 'Poupanca', 9800.00),
(18, 18, 'Corrente', 15700.00),
(19, 19, 'Corrente', 2300.00),
(20, 20, 'Poupanca', 18500.00),
(21, 21, 'Corrente', 7600.00),
(22, 22, 'Poupanca', 11200.00),
(23, 23, 'Corrente', 5400.00),
(24, 24, 'Corrente', 27000.00),
(25, 25, 'Poupanca', 3500.00),
(26, 26, 'Corrente', 42000.00),
(27, 27, 'Poupanca', 8900.00),
(28, 28, 'Corrente', 13400.00),
(29, 29, 'Corrente', 6200.00),
(30, 30, 'Poupanca', 15800.00);


insert into transacoes values
(1, 1, 'Deposito', 2000.00, '2024-01-10'),
(2, 1, 'Saque', 500.00, '2024-01-15'),
(3, 2, 'Deposito', 3000.00, '2024-01-12'),
(4, 3, 'Saque', 1000.00, '2024-01-18'),
(5, 4, 'Deposito', 700.00, '2024-01-20'),
(6, 5, 'Deposito', 5000.00, '2024-01-22'),
(7, 6, 'Saque', 800.00, '2024-01-25'),
(8, 2, 'Saque', 2000.00, '2024-01-28'),
(9, 3, 'Deposito', 1500.00, '2024-01-29'),
(10, 7, 'Deposito', 2500.00, '2024-02-01'),
(11, 7, 'Saque', 1000.00, '2024-02-03'),
(12, 8, 'Deposito', 1200.00, '2024-02-05'),
(13, 9, 'Saque', 800.00, '2024-02-06'),
(14, 10, 'Deposito', 6000.00, '2024-02-07'),
(15, 11, 'Deposito', 7000.00, '2024-02-08'),
(16, 12, 'Saque', 500.00, '2024-02-09'),
(17, 13, 'Deposito', 3000.00, '2024-02-10'),
(18, 14, 'Deposito', 10000.00, '2024-02-11'),
(19, 15, 'Saque', 1200.00, '2024-02-12'),
(20, 10, 'Saque', 2000.00, '2024-02-13'),
(21, 11, 'Saque', 3500.00, '2024-02-14'),
(22, 14, 'Deposito', 8000.00, '2024-02-15'),
(23, 5, 'Saque', 1500.00, '2024-02-16'),
(24, 3, 'Deposito', 2200.00, '2024-02-17'),
(25, 2, 'Deposito', 4500.00, '2024-02-18'),
(26, 16, 'Deposito', 1800.00, '2024-03-01'),
(27, 17, 'Saque', 900.00, '2024-03-02'),
(28, 18, 'Deposito', 5000.00, '2024-03-03'),
(29, 19, 'Deposito', 1200.00, '2024-03-04'),
(30, 20, 'Saque', 2500.00, '2024-03-05'),
(31, 21, 'Deposito', 3000.00, '2024-03-06'),
(32, 22, 'Deposito', 4200.00, '2024-03-07'),
(33, 23, 'Saque', 700.00, '2024-03-08'),
(34, 24, 'Deposito', 9000.00, '2024-03-09'),
(35, 25, 'Deposito', 1500.00, '2024-03-10'),
(36, 26, 'Saque', 4000.00, '2024-03-11'),
(37, 27, 'Deposito', 2200.00, '2024-03-12'),
(38, 28, 'Deposito', 3700.00, '2024-03-13'),
(39, 29, 'Saque', 1100.00, '2024-03-14'),
(40, 30, 'Deposito', 4800.00, '2024-03-15'),
(41, 26, 'Deposito', 10000.00, '2024-03-16'),
(42, 24, 'Saque', 3500.00, '2024-03-17'),
(43, 18, 'Saque', 2000.00, '2024-03-18'),
(44, 14, 'Deposito', 6500.00, '2024-03-19'),
(45, 11, 'Deposito', 5200.00, '2024-03-20');

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
