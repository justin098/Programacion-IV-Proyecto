using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.DALPalindromo;
using BLL.BLLPalindromo;
using System.Drawing;

namespace UIL
{
    public partial class frmPalindrom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.Form.Attributes.Add("autocomplete", "off");
                txtValores.Value = "";
                lblError.Visible = false;
            }
        }

        protected void btnComprobar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtValores.Value.Length < 3)
                {
                    lblError.ForeColor = Color.Red;
                    lblError.Text = "Debe contener al menos 3 caracteres";
                    lblError.Visible = true;
                }
                else
                {

                    lblError.Visible = false;
                    lblError.ForeColor = Color.Blue;
                    BLL.BLLPalindromo.clsPalindromo objBLL = new BLL.BLLPalindromo.clsPalindromo();
                    DAL.DALPalindromo.clsPalindromo objDAL = new DAL.DALPalindromo.clsPalindromo();

                    objDAL.Palabra = txtValores.Value.Replace(" ", "").ToUpper();
                    if (objBLL.PalabraPalindromo(ref objDAL))
                    {
                        lblError.Text = "Es palíndromo";
                        lblError.Visible = true;
                    }
                    else
                    {
                        lblError.Text = "No es palíndromo";
                        lblError.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
        }
    }
}