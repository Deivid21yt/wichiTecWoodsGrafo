using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassEntidades;

namespace ClassDAL
{
    public class ListaAristas
    {
        public  NodoLista inicio = null;
        private int contElemnts = 0;

        public string insertaObjeto1(int numV, float cost)
        {
            string mensaje = "";
            NodoLista nuevo = new NodoLista();
            nuevo.vertexNum = numV;
            nuevo.costo = cost;
            if (inicio == null)
            { // no había objetos en la colección
              // es el primero
                inicio = nuevo;
                contElemnts++;
                mensaje = "Primer elemento de la colección";
            }
            else
            { // ya hay objetos en la colección, no se cuantos
              // hay que recorrer esos objetos y dejar una referencia
              // en el último objeto
                NodoLista t = null;
                t = inicio;
                while (t.next != null)
                {
                    t = t.next;
                }
                //cuando llego aquí estoy seguro que t está en el
                //último
                t.next = nuevo;
                contElemnts++;
                mensaje = "Ya no es el primer Elemento";
            }
            return mensaje;
        }
        public string[] mostrarDatosColeccion()
        {
            string[] cads = new string[contElemnts];
            NodoLista z = null;
            z = inicio;
            int w = 0; // para la localidad del arreglo
            while (z != null)
            {
                cads[w] =
                    $"Posición enlace a:[{z.vertexNum}] " +
                    $"Costo: {z.costo}";
                z = z.next;
                w++;
            }
            return cads;
        }


    }
}
