create  DATABASE negocio;
Use negocio;
CREATE TABLE PROVEDORES (
  idPROVEDORES INT NOT NULL,
  nombre VARCHAR(45) NULL,
  telefono INT NULL,
  correo_electronico VARCHAR(45) NULL,
  PRIMARY KEY (idPROVEDORES));

CREATE TABLE PRODUCTOS(
  idproductos INT NOT NULL,
  marca VARCHAR(45) NULL,
  precio INT NULL,
  descripcion VARCHAR(45) NULL,
  codigo_barra INT NULL,
  producto_existente VARCHAR(45) NULL,
  producto_noexistente VARCHAR(45) NULL,
  idPROVEDORES INT NOT NULL,
  PRIMARY KEY (idproductos),
  INDEX (idPROVEDORES),
    FOREIGN KEY (idPROVEDORES) REFERENCES PROVEDORES (idPROVEDORES));

CREATE TABLE VENTAS (
  idVENTAS INT NOT NULL,
  fecha DATE NULL,
  hora VARCHAR(45) NULL,
  total INT NULL,
  idproductos INT NOT NULL,
  PRIMARY KEY (idVENTAS),
  INDEX (idproductos ) ,
    FOREIGN KEY (idproductos) REFERENCES PRODUCTOS (idproductos));


CREATE TABLE CLIENTES (
  idCLIENTES INT NOT NULL,
  nombre VARCHAR(45) NULL,
  A_paterno VARCHAR(45) NULL,
  A_materno VARCHAR(45) NULL,
  telefono INT NULL,
  correo_electronico VARCHAR(45) NULL,
  direccion VARCHAR(45) NULL,
  PRIMARY KEY (idCLIENTES));


CREATE TABLE PEDIDOS (
  idtpedidos INT NOT NULL AUTO_INCREMENT,
  fecha_inicio DATE NULL,
  fecha_fin DATE NULL,
  anticipo INT NULL,
  idproductos INT NOT NULL,
  idCLIENTES INT NOT NULL,
  PRIMARY KEY (idtpedidos),
  INDEX (idproductos) ,
  INDEX (idCLIENTES) ,
    FOREIGN KEY (idproductos) REFERENCES PRODUCTOS (idproductos),
    FOREIGN KEY (idCLIENTES) REFERENCES CLIENTES (idCLIENTES));


CREATE TABLE EMPLEADO (
  idEMPLEADO INT NOT NULL,
  nombre VARCHAR(45) NULL,
  A_paterno VARCHAR(45) NULL,
  A_materno VARCHAR(45) NULL,
  correo_electronico VARCHAR(45) NULL,
  idtpedidos INT NOT NULL,
  idVENTAS INT NOT NULL,
  PRIMARY KEY (idEMPLEADO),
  INDEX (idtpedidos) ,
  INDEX (idVENTAS),
    FOREIGN KEY (idtpedidos) REFERENCES PEDIDOS (idtpedidos),
    FOREIGN KEY (idVENTAS) REFERENCES VENTAS (idVENTAS));


