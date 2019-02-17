using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.BLLPalindromo
{
    public class NodoDoble
    {

        public char letra;
        public NodoDoble siguiente;
        public NodoDoble anterior;

        //constructor para cuando haya elementos en la lista
        public NodoDoble(char p_letra, NodoDoble p_siguiente, NodoDoble p_anterior)
        {
            this.siguiente = p_siguiente;
            this.anterior = p_anterior;
            this.letra = p_letra;
        }

        //constructor para cuando no haya elementos en la lista
        public NodoDoble(char p_letra)
        {
            this.letra = p_letra;
        }



    }
}
