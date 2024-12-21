using System;
using System.Data;
using System.Data.SqlClient;
using PracticaExamenFinal.CapaLogica;

public class AsignacionLogic
{
    private DBconn dbHelper;

    public AsignacionLogic()
    {
        dbHelper = new DBconn();
    }

    public void AsignarEmpleadoAProyecto(int empleadoId, int proyectoId, DateTime fechaAsignacion)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@EmpleadoId", SqlDbType.Int) { Value = empleadoId },
            new SqlParameter("@ProyectoId", SqlDbType.Int) { Value = proyectoId },
            new SqlParameter("@FechaAsignacion", SqlDbType.Date) { Value = fechaAsignacion }
        };

        dbHelper.ExecuteNonQuery("AsignarEmpleadoAProyecto", parameters);
    }

    public DataTable ListarEmpleadosPorProyecto(int proyectoId)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@ProyectoId", SqlDbType.Int) { Value = proyectoId }
        };

        return dbHelper.ExecuteQuery("ListarEmpleadosPorProyecto", parameters);
    }

    public DataTable ListarProyectosPorEmpleado(int empleadoId)
    {
        SqlParameter[] parameters = new SqlParameter[]
        {
            new SqlParameter("@EmpleadoId", SqlDbType.Int) { Value = empleadoId }
        };

        return dbHelper.ExecuteQuery("ListarProyectosPorEmpleado", parameters);
    }
}
