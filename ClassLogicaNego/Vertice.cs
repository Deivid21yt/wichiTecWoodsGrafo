using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassDAL;
using ClassEntidades;

namespace ClassLogicaNego
{
    public class Vertice
    {
        public Dato info = null;
        public ListaAristas ListaEnlaces = new ListaAristas();

        public Vertice(Dato datos)
        {
            info = datos;
        }

        public string agregarArista(int numV2, float cost2)
        {
            return ListaEnlaces.insertaObjeto1(numV2, cost2);
        }

        public string[] muestraAristas()
        {
            return ListaEnlaces.mostrarDatosColeccion1();
        }
        public string infoDato()
        {
            return $"Vertice: {info.numeroDato}.- " + info.nombreDato;
        }
    }
}
