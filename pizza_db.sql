drop database if exists pizza;
create database pizza;
use pizza;

create table poblaciones(
cod_pobla int (4) primary key ,
poblacion varchar (18)
);

insert into poblaciones(cod_pobla, poblacion) value (1234,"san_antonio");
insert into poblaciones(cod_pobla, poblacion) value (1010,"miguelito");
insert into poblaciones(cod_pobla, poblacion) value (1321,"lupita");
insert into poblaciones(cod_pobla, poblacion) value (4121,"miguel");
insert into poblaciones(cod_pobla, poblacion) value (5151,"progreso");
insert into poblaciones(cod_pobla, poblacion) value (2254,"el_gallito");
insert into poblaciones(cod_pobla, poblacion) value (7056,"barrio_bueno");
insert into poblaciones(cod_pobla, poblacion) value (2971,"maguey");
insert into poblaciones(cod_pobla, poblacion) value (8891,"java");
insert into poblaciones(cod_pobla, poblacion) value (7020,"el_pastor");



create table usuarios(
cod_usuario int primary key auto_increment,
nombre varchar(20),
apellidos varchar (20), 
direccion varchar (20),
cod_pobla int (4) ,
foreign key (cod_pobla) references poblaciones(cod_pobla),
email varchar (29),
telefono varchar (8),
clave int (7),
tipo varchar (20)
);
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("blanca","baldizon","gt",1234,"putin@mail.com","22221389","20","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("maria","tunay","pty",1234,"bla@mail2.com","29705621","35","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("lupe","tinaja","cm",1010,"na@ping.com","24714886","21","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("noelia","meza","nm",1010,"zn@nai.com","59388113","31","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("pedro","bic","zn",1321,"play@pan.com","59714224","40","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("juan","tic","th",1321,"munieco@bin.com","30064621","12","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("diego","tac","cu",4121,"blanco21@cn.es","32245547","35","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("bonito","toe","au",4121,"flores@pn.xn","55213021","32","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("satelite","wou","xe",5151,"pal@nn.cm","28015181","42","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("lucas","hich","cn",5151,"nan@g.com","32153215","80","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("donald","blic","tu",2254,"pinu@ht.tic","50001321","23","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("rick","zinc","ti",2254,"tic@tuc.cx","31112121","18","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("manolo","plomo","h",7056,"tha@nu.mk","21318259","15","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("mario","cobre","he",7056,"tuc@tuc.com","71203120","20","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("luis","neon","o",2971,"tic@toc.tuc","18152015","13","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("manuel","molina","f",2971,"pp@pn.k","20152022","14","m");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("otto","torres","ca",8891,"tu@lup.cm","21315810","19","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("sandra","champu","k",8891,"pax@pn.xc","58102105","29","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("thu","thin","mn",7020,"poc@lm.com","10206000","45","n");
insert into usuarios(nombre,apellidos,direccion,cod_pobla,email,telefono,clave,tipo) value
("antonio","caracun","op",7020,"ping@ping.com","01011100","99","n");


create table pedidos(
cod_pedido int (4) primary key not null,
cod_usuario int auto_increment,
foreign key (cod_usuario) references usuarios(cod_usuario),
fecha int(10),
importe int (7),
estado varchar (15) not null
);
insert into pedidos( importe, estado, cod_pedido, fecha) value (20,"listo", 1,2014);
insert into pedidos(importe, estado, cod_pedido, fecha) value (5,"listo",2,2014);
insert into pedidos(importe, estado, cod_pedido, fecha) value (110,"listo",3,2015);
insert into pedidos(importe, estado, cod_pedido, fecha) value (12,"listo",4, 1998);
insert into pedidos(importe, estado, cod_pedido, fecha) value (3,"listo",5, 2077);
insert into pedidos(importe, estado, cod_pedido, fecha) value (10,"listo",6, 2000);
insert into pedidos(importe, estado, cod_pedido, fecha) value (15,"espera",7,2015);
insert into pedidos(importe, estado, cod_pedido, fecha) value (20,"espera",8,2015);
insert into pedidos(importe, estado, cod_pedido, fecha) value (21,"espera",9,2014);
insert into pedidos(importe, estado, cod_pedido, fecha) value (100,"listo",10,2014);
insert into pedidos(importe, estado, cod_pedido, fecha) value (200,"espera",11,2013);
insert into pedidos(importe, estado, cod_pedido, fecha) value (300,"espera",12,2015);
insert into pedidos(importe, estado, cod_pedido, fecha) value (150,"listo",13,2016);
insert into pedidos(importe, estado, cod_pedido, fecha) value (20,"espera",14,2022);
insert into pedidos(importe, estado, cod_pedido, fecha) value (50,"listo",15,2099);
insert into pedidos(importe, estado, cod_pedido, fecha) value (110,"espera",16, 2000);
insert into pedidos(importe, estado, cod_pedido, fecha) value (120,"espera",17,2010);
insert into pedidos(importe, estado, cod_pedido, fecha) value (210,"listo",18, 2101);
insert into pedidos(importe, estado, cod_pedido, fecha) value (310,"listo",19,2012);
insert into pedidos(importe, estado, cod_pedido, fecha) value (15,"listo",20, 2011);




create table pizzas(
cod_pizz int primary key auto_increment,
nombre varchar (20),
precio_p int (5),
precio_m int (5),
precio_g int (5)
);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("queso",10,20,35);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("jamon",10,20,35);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("peperoni",10,20,35);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("picante",11,21,36);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("dulce",15,25,40);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("ardiente",15,25,40);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("suave",15,25,40);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("tropical",14,24,39);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("carne",14,24,39);
insert into pizzas(nombre,precio_p,precio_m,precio_g)value("deluxe",30,40,55);


create table pizz_pedido (
cod_pedido int (4) not null, 
foreign key (cod_pedido) references pedidos(cod_pedido),
cod_pizz int(3),
foreign key(cod_pizz) references pizzas(cod_pizz),
tamanio varchar(15),
cantidad int (3),
importe int (7)
);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(1,1,"p",2,10);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(1,1,"p",4,20);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(2,1,"p",6,35);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(2,1,"p",6,20);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(3,2,"p",6,21);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(3,2,"g",6,22);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(5,3,"g",6,23);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(7,3,"g",6,35);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(8,3,"g",6,40);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(9,3,"g",6,31);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(10,3,"g",6,32);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(11,3,"g",5,33);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(11,4,"m",1,34);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(11,4,"g",1,35);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(12,5,"m",1,36);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(13,6,"m",1,37);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(14,7,"m",1,38);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(15,8,"m",1,39);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(16,9,"m",1,40);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(17,10,"m",1,40);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(18,1,"m",1,40);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(19,1,"m",1,40);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(20,1,"g",2,40);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(20,2,"g",3,40);
insert into pizz_pedido(cod_pedido,cod_pizz,tamanio,cantidad,importe) value
(20,2,"g",4,40);


select poblaciones.poblacion from poblaciones
inner join usuarios on poblaciones.cod_pobla=usuarios.cod_pobla
inner join pedidos on usuarios.cod_usuario=pedidos.cod_usuario
inner join pizz_pedido on pedidos.cod_pedido=pizz_pedido.cod_pedido
inner join pizzas on pizz_pedido.cod_pizz=pizzas.cod_pizz
where pizzas.nombre='tropical'
;

select usuarios.nombre, usuarios.cod_usuario from usuarios
inner join pedidos on usuarios.cod_usuario=pedidos.cod_usuario
where pedidos.fecha=2014
;


select pizzas.nombre, pizzas.cod_pizz from pizzas
inner join pizz_pedido on pizzas.cod_pizz=pizz_pedido.cod_pizz
inner join pedidos on pizz_pedido.cod_pedido=pedidos.cod_pedido
inner join usuarios on pedidos.cod_usuario=usuarios.cod_usuario
where usuarios.nombre='diego';