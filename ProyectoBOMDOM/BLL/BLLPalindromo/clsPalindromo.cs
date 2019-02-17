using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DALPalindromo;

namespace BLL.BLLPalindromo
{
    public class clsPalindromo
    {

        private Lista lst = new Lista();

        public bool PalabraPalindromo(ref DAL.DALPalindromo.clsPalindromo objDAL)
        {
            try
            {

                foreach (char letras in objDAL.Palabra)
                {

                    lst.Insercion(letras);

                }

                return lst.EsPalindromo();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
