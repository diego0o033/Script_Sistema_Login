-- ****************************************************************** --
--   DDL : Lenguaje de Definicón de Datos
-- ****************************************************************** --

-- verifico que no exista la bases de datos
show databases;


-- creo base de datos
create database sis_log;


-- verifico que se creo la bd correctamente
show databases;



-- entro a la base de datos creada para poder crear las tablas
use sis_log; 




-- controlo que no tenga tablas y sea accesible
show tables;



-- crear las tablas en la base de datos
create table t_usuario(id_usuario int not null
                      ,nombre varchar(25) not null
                      ,apellido varchar(25) not null
                      ,usuario_sis varchar(25) not null
                      ,password varchar(25) not null
                      ,email varchar(25) not null
                      ,fecha_alta date not null
                      ,id_rol int not null
                      );
 
 create table t_rol(id_rol int not null
		    ,descripcion_rol varchar(20)
		    ,fecha_alta date not null 
                    ,fecha_baja date null
                    );                     
 
		
-- controlo que se hayan creado bien las tablas
show tables; 
 
-- Creo claves primaria y las hago autoincremental
alter table t_usuario add primary key (id_usuario);
alter table t_rol add primary key (id_rol);

-- Clave primaria: las dejo en autoincremental
alter table t_usuario modify id_usuario int auto_increment;
alter table t_rol modify id_rol int auto_increment;


-- ****************************************************************** --
--   DML-DQL : Lenguaje de Manipulación y Consulta de Datos 
-- ****************************************************************** --

-- Verificamos si existe almacenado en nuestra bd algun usuario con el mismo nombre, sino existe,lo almacenamos
select count(*) from t_usuario where usuario_sis= ?;

-- Insertamos un registro del tipo usuario(si el nombre de usuario no existe) en la bd (los datos los recibimos del formulario de registro nuevo)
insert into t_usuario(nombre,apellido,usuario_sis,password,email,fecha_alta,id_rol)
values (?,?,?,?,?,?,?);

-- Intentamos realizar el login, si el usuario existe y la contraseña coincide,ademas traemos el rol del usuario
select u.usuario_sis, u.password,r.descripcion_rol 
from t_usuario as u inner join t_rol as r on u.id_rol=r.id_rol where u.usuario_sis=?;

