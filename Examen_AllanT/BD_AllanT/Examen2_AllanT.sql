CREATE DATABASE Examen2_AllanT
GO

USE Examen2_AllanT
GO
CREATE TABLE Usuarios (
    UsuarioID INT IDENTITY (1,1),
    Nombre VARCHAR(50) NOT NULL,
    Correo VARCHAR(50),
    Telefono VARCHAR(15) UNIQUE,
    CONSTRAINT PK_USUARIOID PRIMARY KEY (UsuarioID)
)
GO
CREATE TABLE Rol
(

ID int IDENTITY (1,1) ,
DESCRIPCION VARCHAR (20) NOT NULL,
CONSTRAINT PK_IDRoles PRIMARY KEY (ID),

)
CREATE TABLE Usuario_Sistema 
(
ID INT,
CONSTRAINT PK_IDUserSistem PRIMARY KEY (ID),
    Clave VARCHAR(50) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    UsuarioID INT,
    CONSTRAINT FK_Usuario_Sistema_Usuarios
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios (UsuarioID)
)
GO
CREATE TABLE UsuarioRoles
(
ID INT,
 CONSTRAINT PK_IDuserRol PRIMARY KEY(ID),
UsuarioID INT,
IDRol int ,
Fecha DATETIME CONSTRAINT DF_FECHA DEFAULT GETDATE (),
CONSTRAINT FK_UsuarioRoles_Rol
FOREIGN KEY (IDRol) REFERENCES Rol (ID),
CONSTRAINT FK_UsuarioRoles_Sistema
FOREIGN KEY (UsuarioID) REFERENCES Usuario_Sistema (ID)
)
GO



CREATE TABLE Equipos (
    EquipoID INT IDENTITY (1,1),
    TipoEquipo VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50),
    UsuarioID INT,
    CONSTRAINT PK_EQUIPOID PRIMARY KEY (EquipoID),
    CONSTRAINT FK_UsuarioID FOREIGN KEY (UsuarioID) REFERENCES Usuarios (UsuarioID)
)
GO

CREATE TABLE Reparaciones (
    ReparacionID INT IDENTITY (1,1),
    EquipoID INT,
    FechaSolicitud DATETIME,
    Estado CHAR(1),
    CONSTRAINT PK_REPARACIONID PRIMARY KEY (ReparacionID),
    CONSTRAINT FK_EquipoID FOREIGN KEY (EquipoID) REFERENCES Equipos (EquipoID)
)
GO

CREATE TABLE DetallesReparacion (
    DetalleID INT IDENTITY (1,1),
    ReparacionID INT,
    Descripcion VARCHAR(50),
    FechaInicio DATETIME,
    FechaFin DATETIME,
    CONSTRAINT PK_DETALLEID PRIMARY KEY (DetalleID),
    CONSTRAINT FK_ReparacionID FOREIGN KEY (ReparacionID) REFERENCES Reparaciones (ReparacionID)
)
GO

CREATE TABLE Tecnicos (
    TecnicoID INT IDENTITY (1,1),
    Nombre VARCHAR(50),
    Especialidad VARCHAR(255),
    CONSTRAINT PK_TECNICOID PRIMARY KEY (TecnicoID)
)
GO

CREATE TABLE Asignaciones (
    AsignacionID INT IDENTITY (1,1),
    ReparacionID INT,
    TecnicoID INT,
    FechaAsignacion DATETIME,
    CONSTRAINT PK_AsignacionID PRIMARY KEY (AsignacionID),
    CONSTRAINT FK_ReparacionID_Asig FOREIGN KEY (ReparacionID) REFERENCES Reparaciones (ReparacionID),
    CONSTRAINT FK_TecnicoID FOREIGN KEY (TecnicoID) REFERENCES Tecnicos (TecnicoID)
)
GO





SELECT * FROM Usuarios 
SELECT * FROM Rol
SELECT*FROM UsuarioRoles

Select UsuarioRoles.IDUsuario, Usuario_Sistema.Correo,UsuarioRoles.IDRol,Rol.Descripcion
FROM UsuarioRoles	
INNER JOIN Usuarios ON USUARIO.ID=UsuarioRoles.IDUsuario
INNER JOIN Rol ON Rol.ID=UsuarioRoles.IDRol


create or alter procedure ValidarUsuario

@correo varchar (50),
@clave varchar (50)
as 
begin

select Usuario_Sistema.correo as Correo, usuarios.Nombre, Rol.ID as RolId, rol.DESCRIPCION  as Rol from Usuario_Sistema 
inner join Usuarios on Usuarios.UsuarioID= Usuario_Sistema.UsuarioID
inner join UsuarioRoles on UsuarioRoles.UsuarioID=Usuario_Sistema.ID
inner join Rol on Rol.ID=UsuarioRoles.IDRol
where Usuario_Sistema.Correo=@correo and Usuario_Sistema.Clave = @clave
end
   



   select Tecnicos.TecnicoID as ID, Tecnicos.Nombre, Asignaciones.AsignacionID, Asignaciones.FechaAsignacion, Asignaciones.AsignacionID as Codigo_Reparacion,
   reparaciones.FechaSolicitud,Reparaciones.Estado, DetallesReparacion.Descripcion, Equipos.TipoEquipo, equipos.Modelo, Usuarios.Nombre, Usuarios.Correo from Tecnicos
   inner join Asignaciones ON Asignaciones.TecnicoID = Tecnicos.TecnicoID
   inner join Reparaciones ON Asignaciones.ReparacionID= Reparaciones.ReparacionID
   INNER join DetallesReparacion on DetallesReparacion.ReparacionID= Reparaciones.ReparacionID
   inner join Equipos on Equipos.EquipoID = Reparaciones.EquipoID
   inner join Usuarios on usuarios.UsuarioID = Equipos.UsuarioID
   where Usuarios.Correo=@correo

   

   select UsuarioRoles.ID as ID, Usuario_Sistema.Correo, UsuarioRoles.IDRol,Rol.DESCRIPCION as Rol  from Usuario_Sistema 
   inner join UsuarioRoles on Usuario_Sistema.ID=UsuarioRoles.UsuarioID
   inner join Rol on UsuarioRoles.IDRol=Rol.ID
