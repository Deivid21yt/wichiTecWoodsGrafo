using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntidades
{
    public class Dato
    {
        public int numeroDato { get; set; }
        public string nombreDato { get; set; }

        public Dato() { }
        public Dato(int numero, string nombre)
        {
            numeroDato = numero;
            nombreDato = nombre;
        }
    }
}
