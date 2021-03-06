
CREATE TABLESPACE EMPRESA_BDD_15 DATAFILE 'D:\oracle\EMPRESA_BDD_15' SIZE 5M AUTOEXTEND OFF; 

CREATE USER BDD15 IDENTIFIED BY BDD151314 DEFAULT TABLESPACE EMPRESA_BDD_15 TEMPORARY TABLESPACE 
TEMP QUOTA UNLIMITED ON EMPRESA_BDD_15;

GRANT CREATE SESSION, CREATE TABLE, DELETE ANY TABLE, SELECT ANY 
DICTIONARY, CREATE ANY SEQUENCE TO BDD15;

CREATE TABLE Restaurantes(
  codigo Number(8) PRIMARY KEY,
  nombre Char(20) NOT NULL,
  calle Char(30) NOT NULL,
  "codigo postal" Char(5) NOT NULL,
  comision Number(8, 2)
  ); 

CREATE TABLE "Areas Cobertura" (
  restaurante Number(8) REFERENCES Restaurantes(codigo) ON DELETE CASCADE,
  "codigo postal" Char(5),
  PRIMARY KEY(restaurante, "codigo postal")
  );

CREATE TABLE Horarios (
  restaurante Number(8) REFERENCES Restaurantes(codigo) ON DELETE CASCADE,
  "dia semana" Char(1) NOT NULL,
  hora_apertura Date NOT NULL,
  hora_cierre Date NOT NULL,
  PRIMARY KEY(restaurante, "dia semana")
);

CREATE TABLE Platos (
  restaurante Number(8) REFERENCES Restaurantes(codigo) ON DELETE CASCADE,
  nombre Char(20),
  precio Number(8,2),
  descripcion Char(30),
  categoria Char(10),
  PRIMARY KEY(restaurante, nombre)
);
CREATE INDEX I_CatPlatos ON Platos(categoria);

CREATE TABLE Clientes (
  DNI Char(9) PRIMARY KEY,
  nombre Char(32) NOT NULL,
  apellidos Char(32) NOT NULL,
  calle Char(20) NOT NULL,
  numero Number(4) NOT NULL,
  piso Char(5),
  localidad Char(15),
  "codigo postal" Char(5) NOT NULL,
  telefono Char(9),
  usuario Char(8) UNIQUE NOT NULL,
  contraseņa Char(8) DEFAULT 'Nopass'
);

CREATE TABLE Descuentos (
  codigo Number(8) PRIMARY KEY,
  fecha_caducidad Date NOT NULL,
  "porcentaje descuento" Number(3) NOT NULL CHECK ("porcentaje descuento" > 0 AND "porcentaje descuento"<=100)
);

CREATE TABLE Pedidos (
  codigo Number(8) PRIMARY KEY,
  estado Char(9) DEFAULT 'REST',
  fecha_hora_pedido Date NOT NULL,
  fecha_hora_entrega Date,
  "importe total" Number(8,2),
  cliente Char(9) NOT NULL REFERENCES Clientes(DNI)
);

CREATE TABLE Contiene (
  restaurante Number(8),
  plato Char(20),
  pedido Number(8) REFERENCES Pedidos(codigo) ON DELETE CASCADE,
  "precio con comision" Number(8,2),
  unidades Number(4) NOT NULL,
  PRIMARY KEY (restaurante, plato, pedido),
  FOREIGN KEY (restaurante, plato) REFERENCES Platos(restaurante, nombre) ON DELETE CASCADE
);

CREATE TABLE AplicadoA(
	descuento Number(8) REFERENCES Descuentos(codigo) ON DELETE CASCADE,
	pedido Number(8)REFERENCES Pedidos(codigo) ON DELETE CASCADE,
	PRIMARY KEY(descuento, pedido)
);
	
CREATE SEQUENCE Seq_CodPedidos INCREMENT BY 1 START WITH 1
NOMAXVALUE;

CREATE TABLE DIAS(
	dia Char(1) PRIMARY KEY,
	nombre Char(10) NOT NULL
);
