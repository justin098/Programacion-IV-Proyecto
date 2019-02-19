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

        private void CalculoOperaciones()
        {
            sbyte CantMult = 0, CantDiv = 0, CantSum = 0, CantRes = 0;
            string[] Ejec = txtEjecuciones.Value.Split(' ');
            List<string> lstEjec = Ejec.ToList();
            /*if ((txtValores.Value != "" && lstEjec.ElementAt(lstEjec.Count - 1).Equals("")) && (lstEjec.ElementAt(lstEjec.Count - 2).Equals("-") || lstEjec.ElementAt(lstEjec.Count - 2).Equals("+") || lstEjec.ElementAt(lstEjec.Count - 2).Equals("*") || lstEjec.ElementAt(lstEjec.Count - 2).Equals("/")))
            {*/
            txtEjecuciones.Value += txtValores.Value;
            txtValores.Value = "0";
            //}
            lstEjec.Clear();

            Ejec = txtEjecuciones.Value.Split(' ');
            lstEjec = Ejec.ToList();

            for (int i = 0; i < lstEjec.Count; i++)
            {
                string Operador = lstEjec.ElementAt(i);
                if (Operador.Equals("-"))
                {
                    CantRes++;
                }
                else if (Operador.Equals("+"))
                {
                    CantSum++;
                }
                else if (Operador.Equals("*"))
                {
                    CantMult++;
                }
                else if (Operador.Equals("/"))
                {
                    CantDiv++;
                }
            }

            BLL.BLLCalculadora.clsCalculadora BLLOperacion = new BLL.BLLCalculadora.clsCalculadora();
            DAL.DALCalculadora.clsCalculadora DALVar = new DAL.DALCalculadora.clsCalculadora();

            while (CantDiv > 0 || CantMult > 0)
            {
                for (int i = 0; i < lstEjec.Count; i++)
                {
                    string Operador = lstEjec.ElementAt(i);
                    if (Operador == "/")
                    {
                        DALVar.PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        DALVar.SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));

                        if (DALVar.SegundoNumero == 0)
                        {
                            txtEjecuciones.Value += " = No se puede dividir entre 0";
                            return;
                        }
                        else
                        {
                            BLLOperacion.CalculoDivisión(ref DALVar);

                            lstEjec.RemoveAt(i + 1);

                            lstEjec.RemoveAt(i);
                            lstEjec.Insert(i, DALVar.Resultado.ToString());

                            lstEjec.RemoveAt(i - 1);

                            CantDiv--;
                        }


                    }
                    else if (Operador == "*")
                    {
                        DALVar.PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        DALVar.SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));

                        BLLOperacion.CalculoMultiplicacion(ref DALVar);

                        lstEjec.RemoveAt(i + 1);

                        lstEjec.RemoveAt(i);
                        lstEjec.Insert(i, DALVar.Resultado.ToString());

                        lstEjec.RemoveAt(i - 1);

                        CantMult--;
                    }
                }
            }

            while (CantSum > 0 || CantRes > 0)
            {
                for (int i = 0; i < lstEjec.Count; i++)
                {
                    string Operador = lstEjec.ElementAt(i);
                    if (Operador == "+")
                    {

                        DALVar.PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        DALVar.SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));

                        BLLOperacion.CalculoSuma(ref DALVar);

                        lstEjec.RemoveAt(i + 1);

                        lstEjec.RemoveAt(i);
                        lstEjec.Insert(i, DALVar.Resultado.ToString());

                        lstEjec.RemoveAt(i - 1);

                        CantSum--;
                    }
                    else if (Operador == "-")
                    {
                        DALVar.PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        DALVar.SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));

                        BLLOperacion.CalculoResta(ref DALVar);

                        lstEjec.RemoveAt(i + 1);

                        lstEjec.RemoveAt(i);
                        lstEjec.Insert(i, DALVar.Resultado.ToString());

                        lstEjec.RemoveAt(i - 1);

                        CantRes--;
                    }
                }
            }

            txtEjecuciones.Value += " = " + lstEjec.ElementAt(0).ToString().Replace(',', '.');
        }


        protected void bntIgualP_Click(object sender, EventArgs e)
        {
            try
            {
                CalculoOperaciones();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
            }
        }
    }
}