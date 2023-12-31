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