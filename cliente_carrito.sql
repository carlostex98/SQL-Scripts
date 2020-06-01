SET SERVEROUTPUT ON;
/*TIENDA EDEBE*/

/*CAMBIO DE FORMATO DE FECHA DEL SISTEMA*/
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

/*TABLAS*/
CREATE TABLE bitacora (
  usuario VARCHAR2(100),
  fecha DATE,
  accion VARCHAR2(100)
);

CREATE TABLE clientes(
  nit_cl VARCHAR(10) PRIMARY KEY,
  nombre_cl VARCHAR(50),
  apellido_cl VARCHAR(50),
  direccion_cl VARCHAR(50),
  electrodomestico VARCHAR(100),
  precio_total NUMBER(6,2),
  cuotas_mensual NUMBER(6,2),
  mes VARCHAR(50),
  estado_cliente VARCHAR(100)
);

/*DISPARADOR DE EVENTOS - BITACORA*/
CREATE OR REPLACE TRIGGER eventosB
  BEFORE INSERT OR UPDATE OR DELETE
  ON clientes
  FOR EACH ROW
DECLARE
  accion VARCHAR2(100);
  hora INT := TO_NUMBER(TO_CHAR(sysdate,'HH24'));
BEGIN
  IF inserting AND hora >= 10 AND hora <= 19 THEN
    accion  := 'INSERCION DE DATOS';
    DBMS_OUTPUT.PUT_LINE(accion);
    INSERT INTO bitacora VALUES (user,sysdate,accion);
  ELSIF updating AND hora >= 10 AND hora <= 20 THEN
    accion := 'ACTUALIZACION DE DATOS';
    DBMS_OUTPUT.PUT_LINE(accion);
    INSERT INTO bitacora VALUES (user,sysdate,accion);
  ELSIF deleting AND hora >= 7 AND hora <= 12 THEN
    accion := 'ELIMINACION DE DATOS';
    DBMS_OUTPUT.PUT_LINE(accion);
    INSERT INTO bitacora VALUES (user,sysdate,accion);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No es la hora para realizar ninguna de las acciones que quieres');
  END IF;
END eventosB;


/*PROCEDIMIENTO ALMACENADO PARA EL INGRESO DE CLIENTES*/
CREATE OR REPLACE PROCEDURE pa_cobros_ingreso(nitC VARCHAR,nombreC VARCHAR,apellidoC VARCHAR,direccionC VARCHAR,electrodomestico VARCHAR,precioC INT,cuotasC INT,estadoC VARCHAR)
IS
BEGIN
  INSERT INTO clientes VALUES(nitC,nombreC,apellidoC,direccionC,electrodomestico,precioC,cuotasC,TO_CHAR(SYSDATE,'MONTH'),estadoC);
END;

/*FUNCION QUE DETERMINA EL SALDO MENSUAL A PAGAR*/
CREATE OR REPLACE FUNCTION saldo (precioE NUMBER, tiempo in NUMBER)
  RETURN NUMBER
  IS 
    precio NUMBER(6,2) := precioE;
    total NUMBER(6,2);
  BEGIN
    total := precio / tiempo;
    RETURN total;
END saldo;
  


/*INSERCION DE DATOS
pa_cobros_ingreso(nit del cliente,nombre del cliente,apellido del cliente, zona donde vive el cliente, aparato que compro el cliente, precio del aparato, saldo(precio del aparato,meses a pagar),estado de pago);
*/
EXECUTE pa_cobros_ingreso('k1','Pedro','Perez','Zona 7','Cocina',5000,saldo(5000,12),'Moroso');
EXECUTE pa_cobros_ingreso('k2','Juan','Molina','Zona 17','Refrigerador',4000,saldo(4000,10),'No Moroso');
EXECUTE pa_cobros_ingreso('k3','Domingo','Zetina','Zona 2','Cocina',3000,saldo(3000,16),'Moroso');
EXECUTE pa_cobros_ingreso('k4','Pablo','Vela','Zona 3','Cocina',52000,saldo(51000,12),'No Moroso');
EXECUTE pa_cobros_ingreso('k5','Esteban','Conde','Zona 4','Cocina',5400,saldo(5400,12),'Moroso');
EXECUTE pa_cobros_ingreso('k6','Hans','Orozco','Zona 5','Television',5400,saldo(5400,16),'Moroso');
EXECUTE pa_cobros_ingreso('k7','Luis','Aquino','Zona 6','Television',5000,saldo(5000,16),'No Moroso');
EXECUTE pa_cobros_ingreso('k8','Jose','Mejia','Zona 7','Equipo de sonido',5000,saldo(5000,20),'No Moroso');
EXECUTE pa_cobros_ingreso('k9','Pedro','Fuentes','Zona 7','Television',5000,saldo(5000,20),'Moroso');
EXECUTE pa_cobros_ingreso('k10','Vinicio','Conde','Zona 7','Television',5000,saldo(5000,18),'Moroso');
EXECUTE pa_cobros_ingreso('k11','Rolando','Morataya','Zona 9','Cocina',5000,saldo(5000,18),'No Moroso');
EXECUTE pa_cobros_ingreso('k12','Alejandro','Merino','Zona 9','Cocina',5000,saldo(5000,18),'Moroso');
EXECUTE pa_cobros_ingreso('k13','Erick','Mercado','Zona 12','Computadora',5000,saldo(5000,18),'No Moroso');
EXECUTE pa_cobros_ingreso('k14','Juan','Grijalva','Zona 12','Computadora',5000,saldo(5000,15),'No Moroso');
EXECUTE pa_cobros_ingreso('k15','Yader','Dieguez','Zona 1','Microhondas',5000,saldo(5000,13),'Moroso');
EXECUTE pa_cobros_ingreso('k16','Iker','Yat','Zona 1','Lavadora',5000,saldo(5000,12),'Moroso');
EXECUTE pa_cobros_ingreso('k17','Cristiano','Ronaldo','Zona 3','Cocina',5000,saldo(5000,12),'Moroso');
EXECUTE pa_cobros_ingreso('k18','Leonel','Messi','Zona 4','Lavadora',5000,saldo(5000,12),'No Moroso');
EXECUTE pa_cobros_ingreso('k19','Andres','Higueros','Zona 6','Cocina',5000,saldo(5000,11),'No Moroso');
EXECUTE pa_cobros_ingreso('k20','Carlos','Gamboa','Zona 5','Cocina',5000,saldo(5000,10),'No Moroso');

/*CONSULTAS*/
SELECT * FROM clientes ORDER BY nit_cl ASC;

SELECT * FROM bitacora;

-- ahora yo

create table chato(
idx int,
nombre varchar2(10),
precio int
);

insert into chato values(1,'juan',134);

create or replace procedure gente(idz int, nombrez varchar2, precioz varchar2 )
is
begin
insert into chato values(idz, nombrez, precioz);
end;

execute gente(2,'perz',12);

select * from chato;

create or replace function datos(valor in int)
return int
is
begin

return valor+(valor*0.01);
end;

select idx, datos(precio) from chato;



set SERVEROUTPUT ON;

alter session set nls_date_format='dd/mm/yyyy hh24:mi:ss';

create table control(
usuario varchar(10),
fecha date,
accion varchar(10)
);

create or replace trigger control

