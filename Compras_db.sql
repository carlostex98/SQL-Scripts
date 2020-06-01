Create table clientes (
CodC int primary key,
nombre varchar2(20),
apellido Varchar2(20)
);
Insert into clientes Values (1,'Camilo','turcios');
Insert into clientes Values (2,'Carlos','trujillo');
Insert into clientes Values (3,'ramira','perez');
Insert into clientes Values (4,'julio','wu');
Insert into clientes Values (5,'hernesto','perez');
Insert into clientes Values (6,'casimiro','sandoval');
Insert into clientes Values (7,'raul','chan');
Insert into clientes Values (8,'oscar','man');
Insert into clientes Values (9,'daniel','mejia');
Insert into clientes Values (10,'oracio','peterson');
Insert into clientes Values (11,'ocatvio','paz');
Insert into clientes Values (12,'Rene','turcios');
Insert into clientes Values (13,'renata','ortega');
Insert into clientes Values (14,'claudia','andrade');
Insert into clientes Values (15,'miriam','mata');
Insert into clientes Values (16,'Camilo','cesto');
Insert into clientes Values (17,'ramira','turcios');
Insert into clientes Values (18,'camila','castañeda');
Insert into clientes Values (19,'lucio','guzman');
Insert into clientes Values (20,'das','pernalta');
Insert into clientes Values (21,'pate','andrade');
Insert into clientes Values (22,'pete','turcios');
Insert into clientes Values (23,'abdul','ortega');
Insert into clientes Values (24,'rosa','menchu');
Insert into clientes Values (25,'licia','turcios');

drop table proveedores;
create table proveedores (
CodP int primary key,
nombre Varchar (20)
);
Insert into proveedores values (1,'Acersa');
Insert into proveedores values (2,'Corlco');
Insert into proveedores values (3,'mica');
Insert into proveedores values (4,'Lorosa');
Insert into proveedores values (5,'Micesa');
Insert into proveedores values (6,'sistemas');
Insert into proveedores values (7,'Camisa');
Insert into proveedores values (8,'mangueraSa');
Insert into proveedores values (9,'Lorisaa');
Insert into proveedores values (10,'Calosa');

  
Create table Ventas (
CodV int primary key,
cliente int,
producto varchar2(30),
valorU number,
cantidad int,
fecha Date,
Foreign key (cliente) references clientes (CodC) 
);
insert into Ventas Values (1,1,'comal grande', 100,2,'2-6-2016');
insert into Ventas Values (2,2,'comal', 50,2,'2-2-2016');
insert into Ventas Values (3,1,'comal', 50,2,'2-6-2016');
insert into Ventas Values (4,6,'comal', 50,2,'2-3-2016');
insert into Ventas Values (5,4,'comal', 50,2,'2-1-2016');
insert into Ventas Values (6,5,'comal', 50,2,'2-1-2016');
insert into Ventas Values (7,2,'comal pequeño', 22,2,'2-3-2016');
insert into Ventas Values (8,1,'comal grande', 100,2,'2-2-2016');
insert into Ventas Values (9,3,'comal', 50,2,'2-1-2016');
insert into Ventas Values (10,1,'comal peqqueño', 22,2,'2-3-2016');
insert into Ventas Values (11,1,'comal peqqueño', 22,2,'2-7-2016');


Create table Compras (
CodCo int primary key,
fecha date,
proveedor int,
materia varchar2(30),
cantidad int,
precio number,
foreign key (proveedor) references proveedores(CodP)
);
Insert into Compras values (1,'2-2-2016',1,'acero',1,200);
Insert into Compras values (2,'2-3-2016',2,'mangueras',1,200);
Insert into Compras values (3,'2-4-2016',5,'acero',1,200);
Insert into Compras values (4,'2-5-2016',5,'hojalata',1,200);
Insert into Compras values (5,'2-6-2016',6,'mangueras',1,200);
Insert into Compras values (6,'2-7-2016',8,'acero',1,200);
Insert into Compras values (7,'2-8-2016',3,'hojalata',1,200);
Insert into Compras values (8,'2-9-2016',4,'mangueras',1,200);
Insert into Compras values (9,'2-10-2016',5,'acero',1,200);
Insert into Compras values (10,'11-9-2016',2,'hojalata',1,200);


Create table bitacora (
Accion varchar2(20),
Fecha varchar(20)
);

CREATE or replace function ult_tri(al in date) 
return date
AS
 trim date;
begin
  trim := ADD_MONTHS(SYSDATE,-6);
  return trim;
end;
Select * from ventas where fecha >= ult_tri(sysdate);

CREATE or replace function ult_tresM(al in date) 
return date
AS
 m3 date;
begin
  m3 := ADD_MONTHS(SYSDATE,-3);
  return m3;
end;
Select * from compras where fecha  >= ult_tresM(sysdate);


Select CodV,cliente,producto,valorU,cantidad,valorU*cantidad as total,fecha from ventas where fecha >= ult_tri(sysdate);

select CodCO, fecha, proveedor, materia, precio, cantidad * precio as total from Compras where fecha >= ult_tresM(sysdate); 

select proveedores.nombre, Compras.materia, Compras.Cantidad, Compras.Precio, Compras.Cantidad * Compras.Precio, Compras.Fecha  from Compras
inner join proveedores on  Compras.proveedor = Proveedores.Codp;

create or replace trigger Tbit
 before update or Insert or Delete 
 on Ventas
 for each row
 begin
  if inserting then
    insert into bitacora values ('insercion',sysdate);
  if deleting then
    insert into bitacora values ('insercion',sysdate);
  if updating then
    insert into bitacora values ('insercion',sysdate);
  end if;
 end Tbit;