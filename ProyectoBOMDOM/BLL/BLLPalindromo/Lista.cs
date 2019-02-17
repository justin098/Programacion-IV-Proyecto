using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLLPalindromo
{
    public class Lista
    {

        private NodoDoble inicio, fin;

        public Lista()
        {
            inicio = fin = null;
        }

        public bool estaVacia()
        {
            return inicio == null;
        }



        public void Insercion(char p_letra)
        {
            if (!estaVacia())
            {
                fin = new NodoDoble(p_letra, null, fin);
                fin.anterior.siguiente = fin;
            }
            else
            {
                inicio = fin = new NodoDoble(p_letra);
            }
        }


        public bool EsPalindromo()
        {
            try
            {
                short v_Final = tamañoLista();
                short v_Inicio = 1;
                while ((v_Inicio < v_Final))
                {
                    if (PosicionLetra(v_Inicio).Equals(PosicionLetra(v_Final)))
                    {
                        v_Inicio++;
                        v_Final--;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }

            return true;
        }

        public short tamañoLista()
        {
            short v_Tamaño = 0;
            if (!estaVacia())
            {
                NodoDoble v_Temporal = inicio;
                while (v_Temporal != null)
                {
                    v_Tamaño++;
                    v_Temporal = v_Temporal.siguiente;
                }
            }
            return v_Tamaño;
        }

        public char PosicionLetra(short p_Pos)
        {
            int i = 1;
            if (!estaVacia())
            {
                NodoDoble v_Temporal = inicio;
                while (v_Temporal != null)
                {
                    if (i == p_Pos)
                    {
                        return v_Temporal.letra;
                    }
                    i++;
                    v_Temporal = v_Temporal.siguiente;
                }

            }
            return '/';
        }


    }
}
