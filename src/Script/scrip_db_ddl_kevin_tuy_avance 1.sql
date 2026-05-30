-- Kevin Gustavo Tuy tol - 2026320 - IN4CM 
-- drop database edutech_in4cm; 
create database if not exists edutech_in4cm;
use edutech_in4cm;

create table categorias (
id_categoria int primary key,
nombre varchar(100)
);

create table instructores (
dni varchar(20) primary key,
nombre varchar(100),
especialidad varchar(100)
);

create table estudiantes (
id_estudiante int primary key,
nombre varchar(100),
correo varchar(100)
);

create table cursos (
codigo varchar(20) primary key,
titulo varchar(100),
descripcion text,
duracion_total int,
id_categoria int,
dni_instructor varchar(20),
constraint fk_categoria foreign key (id_categoria) references categorias (id_categoria),
constraint fk_instructor foreign key (dni_instructor) references instructores (dni)
);

create table modulos (
id_modulo int primary key,
nombre varchar(100),
orden_secuencial int,
codigo_curso varchar(20),
constraint fk_curso_modulo foreign key (codigo_curso) references cursos (codigo)
);

create table inscripciones (
id_inscripcion int primary key,
fecha_de_inscripcion timestamp default current_timestamp,
progreso_actual decimal(5,2),
id_estudiante int,
codigo_curso varchar(20),
constraint fk_estudiante_inscripcion foreign key (id_estudiante) references estudiantes (id_estudiante),
constraint fk_curso_inscripcion foreign key (codigo_curso) references cursos (codigo)
);

delimiter //
create procedure sp_crear_categoria(in _id int, in _nom varchar(100))
begin
insert into categorias values (_id, _nom);
end //
delimiter ;

delimiter //
create procedure sp_listar_categorias()
begin
select * from categorias;
end //
delimiter ;

delimiter //
create procedure sp_buscar_categoria(in _id int)
begin
select * from categorias where id_categoria = _id;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_categoria(in _id int, in _nom varchar(100))
begin
update categorias set nombre = _nom where id_categoria = _id;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_categoria(in _id int)
begin
delete from categorias where id_categoria = _id;
end //
delimiter ;

delimiter //
create procedure sp_crear_instructor(in _dni varchar(20), in _nom varchar(100), in _esp varchar(100))
begin
insert into instructores values (_dni, _nom, _esp);
end //
delimiter ;

delimiter //
create procedure sp_listar_instructores()
begin
select * from instructores;
end //
delimiter ;

delimiter //
create procedure sp_buscar_instructor(in _dni varchar(20))
begin
select * from instructores where dni = _dni;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_instructor(in _dni varchar(20), in _nom varchar(100), in _esp varchar(100))
begin
update instructores set nombre = _nom, especialidad = _esp where dni = _dni;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_instructor(in _dni varchar(20))
begin
delete from instructores where dni = _dni;
end //
delimiter ;

delimiter //
create procedure sp_crear_estudiante(in _id int, in _nom varchar(100), in _cor varchar(100))
begin
insert into estudiantes values (_id, _nom, _cor);
end //
delimiter ;

delimiter //
create procedure sp_listar_estudiantes()
begin
select * from estudiantes;
end //
delimiter ;

delimiter //
create procedure sp_buscar_estudiante(in _id int)
begin
select * from estudiantes where id_estudiante = _id;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_estudiante(in _id int, in _nom varchar(100), in _cor varchar(100))
begin
update estudiantes set nombre = _nom, correo = _cor where id_estudiante = _id;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_estudiante(in _id int)
begin
delete from estudiantes where id_estudiante = _id;
end //
delimiter ;

delimiter //
create procedure sp_crear_curso(in _cod varchar(20), in _tit varchar(100), in _desc text, in _dur int, in _cat int, in _dni varchar(20))
begin
insert into cursos values (_cod, _tit, _desc, _dur, _cat, _dni);
end //
delimiter ;

delimiter //
create procedure sp_listar_cursos()
begin
select * from cursos;
end //
delimiter ;

delimiter //
create procedure sp_buscar_curso(in _cod varchar(20))
begin
select * from cursos where codigo = _cod;
end //
delimiter ;

delimiter //
create procedure sp_actualizar_curso(in _cod varchar(20), in _tit varchar(100), in _desc text, in _dur int)
begin
update cursos set titulo = _tit, descripcion = _desc, duracion_total = _dur where codigo = _cod;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_curso(in _cod varchar(20))
begin
delete from cursos where codigo = _cod;
end //
delimiter ;

delimiter //
create procedure sp_crear_inscripcion(in _id int, in _prog decimal(5,2), in _est int, in _cod varchar(20))
begin
insert into inscripciones (id_inscripcion, progreso_actual, id_estudiante, codigo_curso) values (_id, _prog, _est, _cod);
end //
delimiter ;

delimiter //
create procedure sp_listar_inscripciones()
begin
select * from inscripciones;
end //
delimiter ;

delimiter //
create procedure sp_eliminar_inscripcion(in _id int)
begin
delete from inscripciones where id_inscripcion = _id;
end //
delimiter ;

create view vw_categorias as select * from categorias;
create view vw_instructores as select * from instructores;
create view vw_estudiantes as select * from estudiantes;
create view vw_cursos as select * from cursos;
create view vw_inscripciones as select * from inscripciones;

create view vw_detalle_completo_edutech as
select 
    i.id_inscripcion, 
    e.nombre as estudiante, 
    c.titulo as curso, 
    ins.nombre as instructor, 
    cat.nombre as categoria, 
    i.progreso_actual
from inscripciones i, estudiantes e, cursos c, instructores ins, categorias cat
where i.id_estudiante = e.id_estudiante 
and i.codigo_curso = c.codigo 
and c.dni_instructor = ins.dni 
and c.id_categoria = cat.id_categoria;