using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.DALCalculadora
{
    public class clsCalculadora
    {

        private float _PrimerNumero, _SegundoNumero, _Resultado;
        private string _TextoCadena, _MensajeError;

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

        public float PrimerNumero
        {
            get
            {
                return _PrimerNumero;
            }

            set
            {
                _PrimerNumero = value;
            }
        }

        public float Resultado
        {
            get
            {
                return _Resultado;
            }

            set
            {
                _Resultado = value;
            }
        }

        public float SegundoNumero
        {
            get
            {
                return _SegundoNumero;
            }

            set
            {
                _SegundoNumero = value;
            }
        }

        public string TextoCadena
        {
            get
            {
                return _TextoCadena;
            }

            set
            {
                _TextoCadena = value;
            }
        }

    }
}
