CREATE DATABASE DBEmpresa;
USE DBEmpresa;


CREATE TABLE regiones (
	idRegion INT NOT NULL AUTO_INCREMENT,
    nombreRegion VARCHAR(100) NOT NULL,
    PRIMARY KEY PK_idRegion(idRegion)
);

insert into regiones VALUES ('1',"Guatemala");
insert into regiones VALUES ('2',"Peten");

select * from regiones; 

CREATE TABLE departamentos (
	idDepartamento INT NOT NULL AUTO_INCREMENT,
    idRegion INT NOT NULL,
    nombreDepartamento VARCHAR(100) NOT NULL,
    PRIMARY KEY PK_idDepartamento(idDepartamento),
    CONSTRAINT FK_regiones_departamentos
	FOREIGN KEY (idRegion) REFERENCES regiones(idRegion)
);

insert into departamentos VALUES ('1',"Guatemala");
insert into departamentos VALUES ('2',"Peten");

select * from departamentos;

CREATE TABLE oficinas (
	idOficina INT NOT NULL AUTO_INCREMENT,
    idDepartamento INT NOT NULL,
    direccion VARCHAR(300) NOT NULL,
    PRIMARY KEY PK_idOficina(idOficina),
    CONSTRAINT FK_departamentos_oficinas
	FOREIGN KEY (idDepartamento) REFERENCES departamentos(idDepartamento)
);
insert into oficinas VALUES ('1','1','2 Ave. 20-86');
select * from oficinas;

CREATE TABLE telefonos (
	idTelefono INT NOT NULL AUTO_INCREMENT,
    idOficina INT NOT NULL,
    numeroTelefonico VARCHAR(15) NOT NULL,
    PRIMARY KEY PK_idTelefono(idTelefono),
    CONSTRAINT FK_oficinas_telefonos
	FOREIGN KEY (idOficina) REFERENCES oficinas(idOficina)
);

insert into telefonos VALUES ('1','1','50896370');

CREATE TABLE departamentoEmpresa (
	idDepartamentoEmpresa INT NOT NULL AUTO_INCREMENT,
    idOficina INT NOT NULL,
    nombreDepartamento VARCHAR(100) NOT NULL,
    PRIMARY KEY PK_idDepartamentoEmpresa(idDepartamentoEmpresa),
    CONSTRAINT FK_oficinas_departamentoEmpresa
	FOREIGN KEY (idOficina) REFERENCES oficinas(idOficina)
);

insert into departamentoEmpresa values ('1','1','24/7ai.');

CREATE TABLE tipoEmpleado (
	idTipoEmpleado INT NOT NULL AUTO_INCREMENT,
    nombreTipoEmpleado VARCHAR(100) NOT NULL,
    sueldoBase DECIMAL(10,2),
    bonificacion DECIMAL(10,2),
    bonificacionEmpresa DECIMAL(10,2),
    PRIMARY KEY PK_idTipoEmpleado (idTipoEmpleado)
);

insert into tipoEmpleado values ('1','IT. Tecnology','7000','500','300');

CREATE TABLE empleados (
	idEmpleado INT NOT NULL AUTO_INCREMENT,
    idDepartamentoEmpresa INT NOT NULL,
    idTipoEmpleado INT NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fechaDeNacimiento DATE NOT NULL,
    edad INT NOT NULL,
    telefonoPersonal VARCHAR(15) NOT NULL,
    fechaDeContratacion DATE NOT NULL,
    PRIMARY KEY PK_idEmpleado(idEmpleado),
    CONSTRAINT FK_departamentoEmpresa_empleado
	FOREIGN KEY (idDepartamentoEmpresa) REFERENCES departamentoEmpresa(idDepartamentoEmpresa),
	CONSTRAINT FK_tipoEmpleado_empleado
	FOREIGN KEY (idTipoEmpleado) REFERENCES tipoEmpleado(idTipoEmpleado)
);

insert into empleados values('1','1','1','Sergio','Rodas','2003-01-17','18','41539987','2021-12-31');

select * from empleados;