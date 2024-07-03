using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassEntidades
{
    public class NodoLista
    {
        //posición del vertice en la lista de adyacencia
        //a la que tiene un enlace 
        public int vertexNum = 1;//no se pone cero porque existe el vertice en la posicion [0]

        //costo para llegar a ese vertice
        public float costo { get; set; }

        //enlace de lista ligada
        public NodoLista next = null;
    }
}
