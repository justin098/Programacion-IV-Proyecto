using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DALCalculadora
{
    public class clsCalculadora
    {

        private string _MensajeError, _Ejecuciones;

        public string Ejecuciones
        {
            get
            {
                return _Ejecuciones;
            }

            set
            {
                _Ejecuciones = value;
            }
        }

        public string MensajeError
        {
            get
            {
                return _MensajeError;
            }

            set
            {
                _MensajeError = value;
            }
        }

    }
}
