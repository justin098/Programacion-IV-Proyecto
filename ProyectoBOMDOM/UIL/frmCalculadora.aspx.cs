using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL.BLLCalculadora;
using DAL.DALCalculadora;

namespace UIL
{
    public partial class frmCalculador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Form.Attributes.Add("autocomplete", "off");
                txtValores.Value = "0";
            }
        }


        protected void bntIgualP_Click(object sender, EventArgs e)
        {
            try
            {
                txtEjecuciones.Value += txtValores.Value;
                txtValores.Value = "0";

                BLL.BLLCalculadora.clsCalculadora BLLOperacion = new BLL.BLLCalculadora.clsCalculadora();
                DAL.DALCalculadora.clsCalculadora DALVar = new DAL.DALCalculadora.clsCalculadora();

                DALVar.Ejecuciones = txtEjecuciones.Value;

                string resultado = BLLOperacion.Operaciones(ref DALVar);
                if (resultado.Equals(""))
                {
                    txtEjecuciones.Value += " = " + DALVar.MensajeError;
                }
                else
                {
                    txtEjecuciones.Value += " = " + resultado;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }
    }
}