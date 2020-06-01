use tec_pruebas;

select * from mysql.user;
/*drop table super_us_admin, gt_publicaciones;

*/


CREATE TABLE super_us_admin (
  ID_us int primary key auto_increment,
  correo_id nvarchar(130) collate utf8_spanish_ci not null,
  usr_pass nvarchar(300) collate utf8_spanish_ci not null,
  nombre nvarchar(300) collate utf8_spanish_ci not null,
  nickname nvarchar(100) collate utf8_spanish_ci not null,
  creacion timestamp default current_timestamp
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;

CREATE TABLE super_us_revisor (
  ID_us int primary key auto_increment,
  correo_id nvarchar(130) collate utf8_spanish_ci not null,
  usr_pass nvarchar(300) collate utf8_spanish_ci not null,
  nombre nvarchar(300) collate utf8_spanish_ci not null,
  nickname nvarchar(100) collate utf8_spanish_ci not null,
  creacion timestamp default current_timestamp,
  estado int (2)
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;


CREATE TABLE super_us_editor(
  ID_us int primary key auto_increment,
  correo_id nvarchar(130) collate utf8_spanish_ci not null,
  usr_pass nvarchar(300) collate utf8_spanish_ci not null,
  nombre nvarchar(300) collate utf8_spanish_ci not null,
  nickname nvarchar(100) collate utf8_spanish_ci not null,
  creacion timestamp default current_timestamp,
  estado int(2),
  p_estado int(2)
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;


create table gt_publicaciones(
ID_pub int primary key auto_increment,
ID_us int,
miniatura nvarchar(100) collate utf8_spanish_ci not null,
titulo nvarchar (250) collate utf8_spanish_ci not null,
tiempo_creacion timestamp default current_timestamp,
cuerpo mediumtext collate utf8_spanish_ci,
foreign key (ID_us) references super_us_editor(ID_us)
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;

create table revisor_usuario(
	ID_us_revisor int,
    ID_us_editor int,
    foreign key (ID_us_revisor) references super_us_revisor(ID_us),
    foreign key (ID_us_editor) references super_us_editor(ID_us)
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;

create table tags(
	ID_tag int primary key auto_increment,
	nombre nvarchar(200) collate utf8_spanish_ci not null
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;

create table tag_publi(
	ID_tag int,
    ID_pub int,
    foreign key (ID_tag) references tags(ID_tag),
    foreign key (ID_pub) references gt_publicaciones(ID_pub)
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;

create table categoria(
	ID_cat int primary key auto_increment,
    miniatura nvarchar(200) collate utf8_spanish_ci not null,
    descrip nvarchar(240) collate utf8_spanish_ci not null,
    nombre nvarchar(200) collate utf8_spanish_ci not null
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;

create table categoria_pub(
	ID_cat int,
    ID_pub int,
	foreign key (ID_tag) references tags(ID_tag),
    foreign key (ID_cat) references categoria(ID_cat)
)engine=MyISAM default charset=utf8 collate=utf8_spanish_ci;