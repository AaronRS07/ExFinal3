using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PracticaExamenFinal.CapaVistas
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }
        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Empleados"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                           
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void bagregar_Click(object sender, EventArgs e)
        {
            private void btnAgregarEmpleado_Click(object sender, EventArgs e)
            {
                EmpleadoLogic empleadoLogic = new EmpleadoLogic();

                string numeroCarnet = txtNumeroCarnet.Text;
                string nombre = txtNombre.Text;
                DateTime fechaNacimiento = dtpFechaNacimiento.Value;
                string categoria = cmbCategoria.SelectedItem.ToString();
                decimal salario = Convert.ToDecimal(txtSalario.Text);
                string direccion = txtDireccion.Text;
                string telefono = txtTelefono.Text;
                string correo = txtCorreo.Text;

                try
                {
                    empleadoLogic.AgregarEmpleado(numeroCarnet, nombre, fechaNacimiento, categoria, salario, direccion, telefono, correo);
                    MessageBox.Show("Empleado agregado con éxito");
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Error: {ex.Message}");
                }
            }
        }
    }
}