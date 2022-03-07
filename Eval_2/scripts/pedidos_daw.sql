create database pedidos_daw collate utf8mb4_spanish_ci;

use pedidos_daw;

create table pedido
(refped char(5) primary key,
fecped date not null);

create table articulo
(CodArt char(5) primary key,
DesArt varchar(30) not null,
PVPArt float not null constraint ch_PVPArt check (PVPArt > 0));

create table LineaPedido
(RefPed char(5),
CodArt char(5),
CantArt int not null default 1 
        constraint ch_CantArt check (CantArt > 0),
constraint fk_RefPed_LineaPedido foreign key (RefPed) references Pedido(RefPed) on update cascade,
constraint fk_CodArt_LineaPedido foreign key (CodArt) references Articulo(CodArt) on update cascade,
constraint pk_LineaPedido primary key (RefPed, CodArt));

INSERT INTO PEDIDO VALUES ('P0001', '2018-02-16');
INSERT INTO PEDIDO VALUES ('P0002', '2018-02-18');
INSERT INTO PEDIDO VALUES ('P0003', '2018-02-23');
INSERT INTO PEDIDO VALUES ('P0004', '2018-02-25');

INSERT INTO ARTICULO VALUES ('A0043', 'Bolígrafo azul', 0.78);
INSERT INTO ARTICULO VALUES ('A0078', 'Bolígrafo rojo normal', 1.05);
INSERT INTO ARTICULO VALUES ('A0075', 'Lápiz 2B', 0.55);
INSERT INTO ARTICULO VALUES ('A0012', 'Goma de borrar', 0.15);
INSERT INTO ARTICULO VALUES ('A0089', 'Sacapuntas', 0.25);

INSERT INTO LINEAPEDIDO VALUES ('P0001', 'A0043', 10);
INSERT INTO LINEAPEDIDO VALUES ('P0001', 'A0078', 12);
INSERT INTO LINEAPEDIDO VALUES ('P0002', 'A0043', 5);
INSERT INTO LINEAPEDIDO VALUES ('P0003', 'A0075', 20);
INSERT INTO LINEAPEDIDO VALUES ('P0004', 'A0012', 15);
INSERT INTO LINEAPEDIDO VALUES ('P0004', 'A0043', 5);
INSERT INTO LINEAPEDIDO VALUES ('P0004', 'A0089', 50);
 select * from pedido;
 insert into pedido values ('P0005', '2019/02/28');
insert into pedido values ('P0006', '2019/02/03');
  select * from pedido;
  select p.refped, lp.codart, lp.CantArt
  from pedido as p
  join lineapedido as lp on p.refped = lp.RefPed
  order by 1;
  
select p.refped, lp.codart, lp.CantArt
from pedido as p
left join lineapedido as lp on p.refped = lp.RefPed
order by 1;

select p.refped, lp.CodArt, lp.CantArt
from LineaPedido L 
right join pedido P  on p.refped = lp.RefPed
order by 1;

