
-- Crear base de datos
CREATE DATABASE EmpleadosProyectos;
GO

-- Usar la base de datos
USE EmpleadosProyectos;
GO

-- Crear tabla Empleados
CREATE TABLE Empleados (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NumeroCarnet NVARCHAR(50) NOT NULL UNIQUE,
    Nombre NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Categoria NVARCHAR(20) CHECK (Categoria IN ('Administrador', 'Operario', 'Peón')) NOT NULL,
    Salario DECIMAL(10, 2) CHECK (Salario BETWEEN 250000 AND 500000) DEFAULT 250000,
    Direccion NVARCHAR(255) DEFAULT 'San José',
    Telefono NVARCHAR(20),
    Correo NVARCHAR(100) NOT NULL UNIQUE
);

-- Crear tabla Proyectos
CREATE TABLE Proyectos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Codigo NVARCHAR(50) NOT NULL UNIQUE,
    Nombre NVARCHAR(100) NOT NULL UNIQUE,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);

-- Crear tabla Asignaciones
CREATE TABLE Asignaciones (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmpleadoId INT NOT NULL FOREIGN KEY REFERENCES Empleados(Id),
    ProyectoId INT NOT NULL FOREIGN KEY REFERENCES Proyectos(Id),
    FechaAsignacion DATE NOT NULL,
    CONSTRAINT UQ_Asignacion UNIQUE (EmpleadoId, ProyectoId) -- Evita asignaciones duplicadas
);

-- Funcionalidad para registrar empleados
CREATE PROCEDURE RegistrarEmpleado
    @NumeroCarnet NVARCHAR(50),
    @Nombre NVARCHAR(100),
    @FechaNacimiento DATE,
    @Categoria NVARCHAR(20),
    @Salario DECIMAL(10, 2) = 250000,
    @Direccion NVARCHAR(255) = 'San José',
    @Telefono NVARCHAR(20),
    @Correo NVARCHAR(100)
AS
BEGIN
    IF (DATEDIFF(YEAR, @FechaNacimiento, GETDATE()) < 18)
    BEGIN
        THROW 50001, 'El empleado debe ser mayor de edad.', 1;
    END

    IF (@Categoria NOT IN ('Administrador', 'Operario', 'Peón'))
    BEGIN
        THROW 50002, 'Categoría inválida.', 1;
    END

    BEGIN TRY
        INSERT INTO Empleados (NumeroCarnet, Nombre, FechaNacimiento, Categoria, Salario, Direccion, Telefono, Correo)
        VALUES (@NumeroCarnet, @Nombre, @FechaNacimiento, @Categoria, @Salario, @Direccion, @Telefono, @Correo);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;

-- Funcionalidad para listar y buscar empleados por categoría
CREATE PROCEDURE ListarEmpleadosPorCategoria
    @Categoria NVARCHAR(20)
AS
BEGIN
    SELECT * FROM Empleados
    WHERE Categoria = @Categoria;
END;

-- Funcionalidad para registrar proyectos
CREATE PROCEDURE RegistrarProyecto
    @Codigo NVARCHAR(50),
    @Nombre NVARCHAR(100),
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    BEGIN TRY
        INSERT INTO Proyectos (Codigo, Nombre, FechaInicio, FechaFin)
        VALUES (@Codigo, @Nombre, @FechaInicio, @FechaFin);
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;

-- Funcionalidad para listar y buscar proyectos
CREATE PROCEDURE ListarProyectos
    @Nombre NVARCHAR(100) = NULL
AS
BEGIN
    SELECT * FROM Proyectos
    WHERE @Nombre IS NULL OR Nombre LIKE '%' + @Nombre + '%';
END;

-- Funcionalidad para asignar empleados a proyectos
CREATE PROCEDURE AsignarEmpleadoAProyecto
    @EmpleadoId INT,
    @ProyectoId INT,
    @FechaAsignacion DATE
AS
BEGIN
    BEGIN TRY
        INSERT INTO Asignaciones (EmpleadoId, ProyectoId, FechaAsignacion)
        VALUES (@EmpleadoId, @ProyectoId, @FechaAsignacion);
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 2601
        BEGIN
            THROW 50003, 'El empleado ya está asignado a este proyecto.', 1;
        END
        ELSE
        BEGIN
            THROW;
        END
    END CATCH
END;

-- Funcionalidad para listar empleados asignados a un proyecto
CREATE PROCEDURE ListarEmpleadosPorProyecto
    @ProyectoId INT
AS
BEGIN
    SELECT e.*
    FROM Empleados e
    INNER JOIN Asignaciones a ON e.Id = a.EmpleadoId
    WHERE a.ProyectoId = @ProyectoId;
END;

-- Funcionalidad para listar proyectos en los que trabaja un empleado
CREATE PROCEDURE ListarProyectosPorEmpleado
    @EmpleadoId INT
AS
BEGIN
    SELECT p.*
    FROM Proyectos p
    INNER JOIN Asignaciones a ON p.Id = a.ProyectoId
    WHERE a.EmpleadoId = @EmpleadoId;
END;
