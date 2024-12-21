using System;
using System.Data;
using System.Data.SqlClient;
using PracticaExamenFinal.CapaLogica;

public class ProyectoLogic
{
    private DBconn dbHelper;

    public ProyectoLogic()
    {
        dbHelper = new DBconn();
    }

    public void RegistrarProyecto(string codigo, string nombre, DateTime fechaInicio, DateTime fechaFin)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@Codigo", SqlDbType.NVarChar) { Value = codigo },
            new SqlParameter("@Nombre", SqlDbType.NVarChar) { Value = nombre },
            new SqlParameter("@FechaInicio", SqlDbType.Date) { Value = fechaInicio },
            new SqlParameter("@FechaFin", SqlDbType.Date) { Value = fechaFin }
        };

        dbHelper.ExecuteNonQuery("RegistrarProyecto", parameters);
    }

    public DataTable ListarProyectos(string nombre = null)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@Nombre", SqlDbType.NVarChar) { Value = (object)nombre ?? DBNull.Value }
        };

        return dbHelper.ExecuteQuery("ListarProyectos", parameters);
    }
}
