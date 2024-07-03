using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Threading.Tasks;
using ClassEntidades;

namespace ClassDAL
{
    public class ListaAristas : IEnumerable<NodoLista>
    {
        public NodoLista inicio = null;
        private int contElemnts = 0;

        public string insertaObjeto1(int numV, float cost)
        {
            string mensaje = "";
            NodoLista nuevo = new NodoLista();
            nuevo.vertexNum = numV;
            nuevo.costo = cost;
            if (inicio == null)
            {
                inicio = nuevo;
                contElemnts++;
                mensaje = "Primer elemento de la colección";
            }
            else
            {
                NodoLista t = inicio;
                while (t.next != null)
                {
                    t = t.next;
                }
                t.next = nuevo;
                contElemnts++;
                mensaje = "Ya no es el primer Elemento";
            }
            return mensaje;
        }

        public string[] mostrarDatosColeccion1()
        {
            string[] cads = new string[contElemnts];
            NodoLista z = inicio;
            int w = 0;
            while (z != null)
            {
                cads[w] = $"Posición enlace a:[{z.vertexNum}] Costo: {z.costo}";
                z = z.next;
                w++;
            }
            return cads;
        }

        public IEnumerable<NodoLista> mostrarDatosColeccion()
        {
            NodoLista z = inicio;
            while (z != null)
            {
                yield return z;
                z = z.next;
            }
        }

        public IEnumerator<NodoLista> GetEnumerator()
        {
            NodoLista current = inicio;
            while (current != null)
            {
                yield return current;
                current = current.next;
            }
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }
    }
}
