-- Kevin Gustavo Tuy tol - 2026320 - IN4CM 
-- drop database edutech_in4cm; 

use edutech_in4cm;
insert into categorias values 
(1, 'Programación'), (2, 'Diseño'), (3, 'Marketing'), (4, 'Base de Datos'), (5, 'Seguridad');

insert into instructores values 
('DNI01', 'Carlos Pérez', 'Backend'), ('DNI02', 'Ana López', 'UI/UX'),
('DNI03', 'Luis Rodas', 'SEO'), ('DNI04', 'María Juárez', 'SQL'),
('DNI05', 'Jorge Paz', 'Ciberseguridad');

insert into estudiantes values 
(1001, 'Juan Solis', 'juan@mail.com'), (1002, 'Maria Diaz', 'maria@mail.com'),
(1003, 'Pedro Gomez', 'pedro@mail.com'), (1004, 'Ana Ruiz', 'ana@mail.com'),
(1005, 'Luis Mazariegos', 'luis@mail.com');

insert into cursos values 
('CUR01', 'Java Básico', 'Fundamentos', 40, 1, 'DNI01'),
('CUR02', 'Figma Pro', 'Diseño web', 30, 2, 'DNI02'),
('CUR03', 'SEO Avanzado', 'Estrategia', 25, 3, 'DNI03'),
('CUR04', 'MySQL Master', 'Consultas', 50, 4, 'DNI04'),
('CUR05', 'Ethical Hacking', 'Seguridad', 60, 5, 'DNI05');

insert into inscripciones (id_inscripcion, progreso_actual, id_estudiante, codigo_curso) values 
(9001, 25.50, 1001, 'CUR01'), (9002, 50.00, 1002, 'CUR02'),
(9003, 75.25, 1003, 'CUR03'), (9004, 10.00, 1004, 'CUR04'),
(9005, 90.00, 1005, 'CUR05');

call sp_crear_categoria(6, 'Cloud Computing');
call sp_crear_instructor('DNI06', 'Sara Lima', 'AWS');
call sp_crear_estudiante(1006, 'Kevin Tuy', 'kevin@mail.com');
call sp_crear_curso('CUR06', 'AWS Cloud', 'Infraestructura', 80, 6, 'DNI06');
call sp_crear_inscripcion(9006, 5.00, 1006, 'CUR06');

select * from vw_categorias;
select * from vw_instructores;
select * from vw_estudiantes;
select * from vw_cursos;
select * from vw_inscripciones;
select * from vw_detalle_completo_edutech;