using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DALCalculadora;

namespace BLL.BLLCalculadora
{
    public class clsCalculadora
    {
        public string Operaciones(ref DAL.DALCalculadora.clsCalculadora objDAL)
        {
            sbyte CantMult = 0, CantDiv = 0, CantSum = 0, CantRes = 0;
            string[] Ejec = objDAL.Ejecuciones.Split(' ');
            List<string> lstEjec = Ejec.ToList();

            float PrimerNumero, SegundoNumero;

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

            while (CantDiv > 0 || CantMult > 0)
            {
                for (int i = 0; i < lstEjec.Count; i++)
                {
                    string Operador = lstEjec.ElementAt(i);

                    if (Operador == "/")
                    {
                        PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));

                        if (SegundoNumero == 0)
                        {
                            objDAL.MensajeError += " = No se puede dividir entre 0";
                            return "";
                        }
                        else
                        {

                            lstEjec.RemoveAt(i + 1);

                            lstEjec.RemoveAt(i);
                            lstEjec.Insert(i, (PrimerNumero / SegundoNumero).ToString());

                            lstEjec.RemoveAt(i - 1);

                            CantDiv--;
                        }


                    }
                    else if (Operador == "*")
                    {
                        PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));


                        lstEjec.RemoveAt(i + 1);

                        lstEjec.RemoveAt(i);
                        lstEjec.Insert(i, (PrimerNumero * SegundoNumero).ToString());

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

                        PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));

                        lstEjec.RemoveAt(i + 1);

                        lstEjec.RemoveAt(i);
                        lstEjec.Insert(i, (PrimerNumero + SegundoNumero).ToString());

                        lstEjec.RemoveAt(i - 1);

                        CantSum--;
                    }
                    else if (Operador == "-")
                    {
                        PrimerNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i - 1).ToString().Replace('.', ','));
                        SegundoNumero = (float)Convert.ToDouble(lstEjec.ElementAt(i + 1).ToString().Replace('.', ','));


                        lstEjec.RemoveAt(i + 1);

                        lstEjec.RemoveAt(i);
                        lstEjec.Insert(i, (PrimerNumero - SegundoNumero).ToString());

                        lstEjec.RemoveAt(i - 1);

                        CantRes--;
                    }
                }
            }

            return lstEjec.ElementAt(0).ToString().Replace(',', '.');
        }

    }
}
