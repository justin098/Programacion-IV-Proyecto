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
            }
        }

        protected void btnComprobar_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.ForeColor = Color.Blue;
                BLL.BLLPalindromo.clsPalindromo objBLL = new BLL.BLLPalindromo.clsPalindromo();
                DAL.DALPalindromo.clsPalindromo objDAL = new DAL.DALPalindromo.clsPalindromo();

                objDAL.Palabra = txtValores.Value.Replace(" ", "").ToUpper();
                if (objBLL.PalabraPalindromo(ref objDAL))
                {
                    lblError.Text = "Es palíndromo";
                }
                else
                {
                    lblError.Text = "No es palíndromo";
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
        }
    }
}