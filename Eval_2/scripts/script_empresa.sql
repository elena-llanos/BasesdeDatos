create database empresa collate utf8mb4_spanish_ci;

use empresa;

create table depart
(dept_no int primary key constraint ch_Depart_dept_no check (dept_no between 10 and 100),
dnombre varchar(40) unique not null,
loc varchar(40) not null);

create table emple
(emp_no int primary key constraint ch_emp_no check (emp_no > 0),
apellido varchar(40) not null,
oficio enum ('EMPLEADO', 'VENDEDOR', 'DIRECTOR', 'ANALISTA', 'PROGRAMADOR', 'PRESIDENTE') not null,
dir int,
fecha_alt date not null,
salario float not null constraint ch_salario check (salario >= 600),
comision float constraint ch_comision check (comision >= 0),
dept_no int default 10 not null,
constraint fk_dir_Emple foreign key(dir) references emple(emp_no) on update cascade,
constraint fk_dept_no_Emple foreign key(dept_no) references depart(dept_no) on update cascade);

INSERT INTO DEPART VALUES (10, 'CONTABILIDAD', 'SEVILLA');
INSERT INTO DEPART VALUES (20, 'INVESTIGACIÓN', 'MADRID');
INSERT INTO DEPART VALUES (30, 'VENTAS', 'BARCELONA');

INSERT INTO EMPLE VALUES (7839, 'REY', 'PRESIDENTE', NULL, '2014/11/17', 3900, 0, 10);
INSERT INTO EMPLE VALUES (7698, 'NEGRO', 'DIRECTOR', 7839, '2014/05/01', 2200, 0, 30);
INSERT INTO EMPLE VALUES (7738, 'CEREZO', 'DIRECTOR', 7839, '2014/09/06', 2210, 0, 10);
INSERT INTO EMPLE VALUES (7566, 'JIMÉNEZ', 'DIRECTOR', 7839, '2014/02/04', 2300, 0, 20);
INSERT INTO EMPLE VALUES (7499, 'ARROYO', 'VENDEDOR', 7698, '2013/02/20', 1200, 240, 30);
INSERT INTO EMPLE VALUES (7521, 'SALA', 'VENDEDOR', 7698, '2014/02/22', 960, 390, 30);
INSERT INTO EMPLE VALUES (7654, 'MARTÍN', 'VENDEDOR', 7698, '2014/09/29', 965, 1000, 30);
INSERT INTO EMPLE VALUES (7844, 'TOVAR', 'VENDEDOR', 7698, '2014/09/08', 1100, 0, 30);
INSERT INTO EMPLE VALUES (7900, 'JIMENO', 'EMPLEADO', 7698, '2014/12/03', 725, 0, 30);
INSERT INTO EMPLE VALUES (7369, 'SÁNCHEZ', 'EMPLEADO', 7900, '2016/12/12', 600, 0, 20);
INSERT INTO EMPLE VALUES (7788, 'GIL', 'ANALISTA', 7566, '2017/04/23', 2350, 0, 20);
INSERT INTO EMPLE VALUES (7876, 'ALONSO', 'EMPLEADO', 7788, '2017/08/09', 860, 0, 20);