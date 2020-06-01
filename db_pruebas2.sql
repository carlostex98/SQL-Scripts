
drop database dft;
create database dft;
use dft;
use systt;



create table usuarios(
cui varchar(14) primary key,
nombre nvarchar(200),
nocimiento date,
correo nvarchar(100) unique,
telefono varchar(20),
carnet int unique,
rol int,
pass nvarchar(70),
clve nvarchar(70)
);

insert into usuarios values('1','Carlos Admin','1998-06-06','cctenes@gmail.com','55616016','10',1,'1','1234')

select * from usuarios







create table espacio(
id_e int identity(1,1) primary key,
info nvarchar(130) unique 
);






create table reserva(
id_e int not null,
id_r int identity(1,1) primary key,
cui varchar(14) not null,
inicio time not null,
fin time not null,
ruta_c nvarchar(150),
estado int not null,
fecha date,
ruta_p nvarchar(100)
);


alter table reserva add ffin date
alter table reserva add tipo int
alter table reserva add dia int
alter table reserva add detalle text

select * from reserva







create table bit_reserva(
cui varchar(14),
id_r int,
tiempo datetime
);



create table asistencia(
id_r int,
cui varchar(14),
tiempo datetime
);



create table incidentes(
id_i int identity(1,1) primary key,
id_r int,
fecha date,
texto text
);

select * from asistencia;
select* from incidentes


create table matriculacionx(
id_e int,
cui varchar(14)
);


create table matriculacion(
id_r int,
cui varchar(14)
);

create table cat(
id_cat int identity(1,1) primary key,
tcat nvarchar(130) unique 
);


create table insumo(
id_n varchar(10)unique not null,
id_cat int,
estado int not null,
detalle text not null
);

create table prestamo(
id_n varchar(10) not null,
cui varchar(14),
ipt date,
ipf date
);

create table ins(
id_n varchar(10) not null,
cui varchar(14),
fec date,
detalle text
);

create table fesp(
fec date,
detalle text
);


create table t_cues(
id_ct varchar(14) primary key,
id_r int,
cui varchar(14),
detalle text
);

create table preguntas(
idp int,
id_ct varchar(14),
titulo text,
p1 text,
p2 text,
p3 text,
p4 text,
corr int
);

create table notas(
cui varchar(14),
id_ct varchar(14),
obte int,
sobre int
);

delete from notas




select * from fesp


select * from insumo

select * from matriculacionx



ALTER TABLE reserva ADD FOREIGN KEY (id_e) REFERENCES espacio(id_e);
ALTER TABLE reserva ADD FOREIGN KEY (cui) REFERENCES usuarios(cui); 
ALTER TABLE bit_reserva ADD FOREIGN KEY (cui) REFERENCES usuarios(cui); 
ALTER TABLE bit_reserva ADD FOREIGN KEY (id_r) REFERENCES reserva(id_r); 
ALTER TABLE incidentes ADD FOREIGN KEY (id_r) REFERENCES reserva(id_r); 
ALTER TABLE matriculacionx ADD FOREIGN KEY (cui) REFERENCES usuarios(cui);
ALTER TABLE matriculacionx ADD FOREIGN KEY (id_e) REFERENCES espacio(id_e);
ALTER TABLE matriculacion ADD FOREIGN KEY (cui) REFERENCES usuarios(cui);
ALTER TABLE matriculacion ADD FOREIGN KEY (id_r) REFERENCES reserva(id_r);
ALTER TABLE asistencia ADD FOREIGN KEY (cui) REFERENCES usuarios(cui);
ALTER TABLE prestamo ADD FOREIGN KEY (cui) REFERENCES usuarios(cui);
ALTER TABLE prestamo ADD FOREIGN KEY (id_n) REFERENCES insumo(id_n);
ALTER TABLE insumo ADD FOREIGN KEY (id_cat) REFERENCES cat(id_cat);
ALTER TABLE ins ADD FOREIGN KEY (cui) REFERENCES usuarios(cui);
ALTER TABLE ins ADD FOREIGN KEY (id_n) REFERENCES insumo(id_n);
ALTER TABLE t_cues ADD FOREIGN KEY (cui) REFERENCES usuarios(cui);
ALTER TABLE t_cues ADD FOREIGN KEY (id_r) REFERENCES reserva(id_r);
ALTER TABLE preguntas ADD FOREIGN KEY (id_ct) REFERENCES t_cues(id_ct);
ALTER TABLE notas ADD FOREIGN KEY (cui) REFERENCES usuarios(cui);
ALTER TABLE notas ADD FOREIGN KEY (id_ct) REFERENCES t_cues(id_ct);


select espacio.info from espacio inner join matriculacionx on espacio.id_e=matriculacionx.id_e where cui=91;

select count(*) from espacio inner join matriculacionx on espacio.id_e=matriculacionx.id_e where cui=91;


select reserva.cui, reserva.fecha, reserva.inicio,reserva.fin, reserva.ruta_p from reserva inner join matriculacion on reserva.id_r=matriculacion.id_r where matriculacion.cui=91

select count(*) from reserva inner join matriculacion on reserva.id_r=matriculacion.id_r where matriculacion.cui=91


select cat.tcat,insumo.detalle,insumo.id_n from cat inner join insumo on cat.id_cat=insumo.id_cat;

SELECT cui, nombre FROM usuarios WHERE rol=3 OR rol=4

SELECT * FROM prestamo

select insumo.id_n, prestamo.cui, prestamo.cui, prestamo.ipt from insumo inner join prestamo on insumo.id_n=prestamo.id_n where estado=1;
SELECT cui FROM insumo INNER JOIN prestamo ON insumo.id_n=prestamo.id_n WHERE estado=1 

alter table reserva add ruta_p nvarchar(150)

SELECT cat.tcat,insumo.detalle,insumo.id_n, insumo.estado, prestamo.cui, prestamo.ipt, prestamo.ipf FROM prestamo inner join insumo on prestamo.id_n=insumo.id_n inner join cat on insumo.id_cat=cat.id_cat

select count(*) from prestamo where cui=3

SELECT * FROM reserva where ffin<'2018-01-01'

alter table reserva drop column tipo

SELECT * FROM insumo INNER JOIN prestamo ON insumo.id_n=prestamo.id_n WHERE estado=1 AND prestamo.id_n='5D4Q7T4V' 

select reserva.estado, espacio.info,reserva.cui, reserva.inicio,reserva.fin, reserva.fecha, reserva.ruta_c from espacio inner join reserva on espacio.id_e=reserva.id_e ;

select * from insumo



SELECT cat.tcat,insumo.detalle,insumo.id_n, insumo.estado, prestamo.cui, prestamo.ipt, prestamo.ipf FROM prestamo INNER JOIN insumo ON prestamo.id_n=insumo.id_n INNER JOIN cat ON insumo.id_cat=cat.id_cat WHERE cui='3' AND estado=1 and ipf is null


SELECT cat.tcat,insumo.detalle,insumo.id_n, insumo.estado, prestamo.cui, prestamo.ipt, prestamo.ipf FROM insumo INNER JOIN cat on insumo.id_cat=cat.id_cat inner join prestamo on insumo.id_n=prestamo.id_n WHERE cui='3' AND estado=1



select reserva.estado, espacio.info,reserva.cui, reserva.inicio,reserva.fin, reserva.fecha, reserva.ruta_c, reserva.ffin, reserva.tipo, reserva.ruta_p, reserva.dia from espacio inner join reserva on espacio.id_e=reserva.id_e WHERE (fecha<'2018-11-20' and ffin is null) or (ffin<'2018-11-20' and fecha<'2018-11-20') 

select * from preguntas

select t_cues.id_ct,t_cues.detalle from t_cues inner join reserva on t_cues.id_r=reserva.id_r inner join matriculacion on reserva.id_r=matriculacion.id_r