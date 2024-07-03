using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassEntidades;

namespace ClassLogicaNego
{
    public class MiGrafo
    {
        public List<Vertice> ListaAdyc = new List<Vertice>();

        public string agregarVertice(Dato objInfo)
        {
            ListaAdyc.Add(new Vertice(objInfo));
            return "Nuevo vertice creado";
        }

        public string agregarArista(int VertOrigen, int VertDestino, float cost3)
        {
            string msg = "";
            //hay que verificar que VertOrigen y VertDestino este en el rango de
            //los objetos del List<>
            if (VertOrigen >= 0 && VertOrigen <= (ListaAdyc.Count - 1))
            {
                if (VertDestino >= 0 && VertDestino <= (ListaAdyc.Count - 1))
                {
                    ListaAdyc[VertOrigen].agregarArista(VertDestino, cost3);
                    msg = "Arista agregada";
                }
                else
                    msg = "La posición del vértice Destino no exixte en la Lista de Adyacencia";
            }
            else
            {
                msg = "La posición del vértice Origen no exixte en la Lista de Adyacencia";
            }
            return msg;
        }

        public string[] mostrarAristasVertice(int posiVert, ref string msg)
        {

            string[] salida = null;
            if (posiVert >= 0 && posiVert <= (ListaAdyc.Count - 1))
            {
                salida = ListaAdyc[posiVert].muestraAristas();
                msg = "Correcto";
            }
            else
            {
                msg = "La posición del vértice no exixte en la Lista de Adyacencia";
            }
            return salida;
        }


        //Mostrar tambien el nombre del vertice destino
        public List<string> mostrarAristasVertice2(int posiVert, ref string msg)
        {
            // Referencia par a recorrer los nodos de la lista de aristas
            NodoLista temp = null;


            List<string> salida = new List<string>();
            if (posiVert >= 0 && posiVert <= (ListaAdyc.Count - 1))
            {
                temp = ListaAdyc[posiVert].ListaEnlaces.inicio;

                while (temp != null)
                {
                    salida.Add(
                        $"Vertive destino: {ListaAdyc[temp.vertexNum].info.nombreDato} " +
                        $"Posicion enlace a:[{temp.vertexNum}] " +
                        $"Costo: {temp.costo}");
                    temp = temp.next;
                }
                msg = "Correcto";
            }
            else
            {
                msg = "La posición del vértice no exixte en la Lista de Adyacencia";
            }
            return salida;
        }

        public string[] mostrarVertices()
        {
            string[] cads = new string[ListaAdyc.Count];
            int h = 0;
            for (h = 0; h <= ListaAdyc.Count - 1; h++)
            {
                cads[h] = ListaAdyc[h].infoDato();
            }
            return cads;
        }

    }
}
