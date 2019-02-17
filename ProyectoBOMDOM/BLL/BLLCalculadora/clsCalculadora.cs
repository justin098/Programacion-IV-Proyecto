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

        public float CalculoSuma(ref DAL.DALCalculadora.clsCalculadora objDAL)
        {
            try
            {
                objDAL.Resultado = objDAL.PrimerNumero + objDAL.SegundoNumero;
            }
            catch (Exception Ex)
            {
                objDAL.TextoCadena = Ex.ToString();
            }
            return objDAL.Resultado;
        }

        public float CalculoResta(ref DAL.DALCalculadora.clsCalculadora objDAL)
        {
            try
            {
                objDAL.Resultado = objDAL.PrimerNumero - objDAL.SegundoNumero;
            }
            catch (Exception Ex)
            {
                objDAL.TextoCadena = Ex.ToString();
            }
            return objDAL.Resultado;
        }

        public float CalculoMultiplicacion(ref DAL.DALCalculadora.clsCalculadora objDAL)
        {
            try
            {
                objDAL.Resultado = objDAL.PrimerNumero * objDAL.SegundoNumero;
            }
            catch (Exception Ex)
            {
                objDAL.TextoCadena = Ex.ToString();
            }
            return objDAL.Resultado;
        }

        public float CalculoDivisión(ref DAL.DALCalculadora.clsCalculadora objDAL)
        {
            try
            {
                objDAL.Resultado = objDAL.PrimerNumero / objDAL.SegundoNumero;
            }
            catch (Exception Ex)
            {
                objDAL.TextoCadena = Ex.ToString();
            }
            return objDAL.Resultado;
        }

    }
}
