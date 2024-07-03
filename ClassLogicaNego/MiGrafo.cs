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
        private void OrdenTopologicoUtil(int v, bool[] visitado, Stack<int> pila)
        {
            visitado[v] = true;

            foreach (var arista in ListaAdyc[v].ListaEnlaces)
            {
                if (!visitado[arista.vertexNum])
                {
                    OrdenTopologicoUtil(arista.vertexNum, visitado, pila);
                }
            }

            pila.Push(v);
        }

        // Método para realizar la ordenación topológica
        public List<int> OrdenTopologico()
        {
            int n = ListaAdyc.Count;
            bool[] visitado = new bool[n];
            Stack<int> pila = new Stack<int>();

            for (int i = 0; i < n; i++)
            {
                if (!visitado[i])
                {
                    OrdenTopologicoUtil(i, visitado, pila);
                }
            }

            List<int> orden = new List<int>();
            while (pila.Count > 0)
            {
                orden.Add(pila.Pop());
            }

            return orden;
        }
        // Método para buscar un vértice específico en la ordenación topológica
        public int BuscarVerticeTopologico(int vertice)
        {
            var orden = OrdenTopologico();
            return orden.IndexOf(vertice);
        }
        // Método para encontrar un camino entre dos vértices usando la ordenación topológica
        public List<int> CaminoTopologico(int origen, int destino)
        {
            var orden = OrdenTopologico();
            List<int> camino = new List<int>();

            bool encontrado = false;
            foreach (var vertice in orden)
            {
                if (vertice == origen)
                {
                    encontrado = true;
                }
                if (encontrado)
                {
                    camino.Add(vertice);
                }
                if (vertice == destino)
                {
                    break;
                }
            }

            return camino;
        }
        // Implementación del algoritmo de Dijkstra
        public (List<int> camino, float costo) Dijkstra(int origen, int destino)
        {
            int n = ListaAdyc.Count;
            float[] distancias = new float[n];
            int[] anteriores = new int[n];
            bool[] visitado = new bool[n];

            for (int i = 0; i < n; i++)
            {
                distancias[i] = float.MaxValue;
                anteriores[i] = -1;
            }

            distancias[origen] = 0;
            var colaPrioridad = new SortedSet<(float, int)>(Comparer<(float, int)>.Create((x, y) =>
            {
                int result = x.Item1.CompareTo(y.Item1);
                return result == 0 ? x.Item2.CompareTo(y.Item2) : result;
            }));

            colaPrioridad.Add((0, origen));

            while (colaPrioridad.Count > 0)
            {
                var (dist, u) = colaPrioridad.First();
                colaPrioridad.Remove(colaPrioridad.First());

                if (visitado[u])
                {
                    continue;
                }

                visitado[u] = true;

                foreach (var arista in ListaAdyc[u].ListaEnlaces)
                {
                    int v = arista.vertexNum;
                    float peso = arista.costo;

                    if (distancias[u] + peso < distancias[v])
                    {
                        distancias[v] = distancias[u] + peso;
                        anteriores[v] = u;
                        colaPrioridad.Add((distancias[v], v));
                    }
                }
            }

            List<int> camino = new List<int>();
            for (int at = destino; at != -1; at = anteriores[at])
            {
                camino.Add(at);
            }

            camino.Reverse();

            return (camino, distancias[destino]);
        }

    }
}
