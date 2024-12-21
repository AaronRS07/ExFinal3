using System.Data.SqlClient;
using System.Data;
using System;
using PracticaExamenFinal.CapaLogica;



public class EmpleadoLogic
{
    private DBconn dbHelper;

    public EmpleadoLogic()
    {
        dbHelper = new DBconn();
    }

    public void RegistrarEmpleado(string numeroCarnet, string nombre, DateTime fechaNacimiento, string categoria, decimal salario, string direccion, string telefono, string correo)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@NumeroCarnet", SqlDbType.NVarChar) { Value = numeroCarnet },
            new SqlParameter("@Nombre", SqlDbType.NVarChar) { Value = nombre },
            new SqlParameter("@FechaNacimiento", SqlDbType.Date) { Value = fechaNacimiento },
            new SqlParameter("@Categoria", SqlDbType.NVarChar) { Value = categoria },
            new SqlParameter("@Salario", SqlDbType.Decimal) { Value = salario },
            new SqlParameter("@Direccion", SqlDbType.NVarChar) { Value = direccion },
            new SqlParameter("@Telefono", SqlDbType.NVarChar) { Value = telefono },
            new SqlParameter("@Correo", SqlDbType.NVarChar) { Value = correo }
        };

        dbHelper.ExecuteNonQuery("RegistrarEmpleado", parameters);
    }

    public DataTable ListarEmpleadosPorCategoria(string categoria)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@Categoria", SqlDbType.NVarChar) { Value = categoria }
        };

        return dbHelper.ExecuteQuery("ListarEmpleadosPorCategoria", parameters);
    }
}
