using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassDAL;
using ClassLogicaNego;
using ClassEntidades;
using Newtonsoft.Json;


namespace Grafo
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        MiGrafo grafo = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {//la carga de la pagina por primera vez 
                grafo = new MiGrafo();
                Session["grafo"] = grafo;
            }
            else
            {// Ya viene de un postback
                grafo = (MiGrafo)Session["grafo"];

            }
        }

        protected void btnAgregarVer_Click(object sender, EventArgs e)
        {
            string mens = "";
            string script = "";
            if (txttNumero.Text == "" || txtNombre.Text == "" )
            {
                script = $"alert('Te fato llenar algun campo');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }else
            {
                Dato nuevo = new Dato(int.Parse(txttNumero.Text), txtNombre.Text);
                mens = grafo.agregarVertice(nuevo);
                //txtConfirmacion.Text = mens;
                txttNumero.Text = "";
                txtNombre.Text = "";
                script = $"alert('{mens}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            Session["grafo"] = grafo;
        }

        protected void btnAgregaArista_Click(object sender, EventArgs e)
        {
            string mens = "";
            string script = "";
            if (TextBox1.Text == "" || TextBox2.Text == "" || txtCosto.Text == "")
            {
                script = $"alert('Te fato llenar algun campo');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            else
            {
                mens = grafo.agregarArista(int.Parse(TextBox1.Text), int.Parse(TextBox2.Text), float.Parse(txtCosto.Text));
                txtCosto.Text = "";
                TextBox2.Text = "";
                TextBox1.Text = "";
                script = $"alert('{mens}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            Session["grafo"] = grafo;
        }

        protected void btnMostrarVertice_Click(object sender, EventArgs e)
        {
            string[] vertxs = null;
            vertxs = grafo.mostrarVertices();
            ListBox3.Items.Clear();
            foreach (string s in vertxs)
            {
                ListBox3.Items.Add(s);
            }
           
        }

        protected void btnMostrarAristas_Click(object sender, EventArgs e)
        {
            string msj = "";
            int posiVertx = -5;
            List<string> aristas2 = null;
            if (ListBox3.SelectedIndex != -1)
            {
                posiVertx = ListBox3.SelectedIndex;
                aristas2 = grafo.mostrarAristasVertice2(posiVertx, ref msj);
                ListBox2.Items.Clear();
                foreach (string w in aristas2)
                {
                    ListBox2.Items.Add(w);
                }
            }
            else
            {
                string script = $"alert('Debe elegir un vértice de la lista');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);

            }
        }

        protected void btnGrafo_Click(object sender, EventArgs e)
        {
            // Convertimos la lista de vértices a JSON para enviarla a JavaScript
            var verticesJson = JsonConvert.SerializeObject(grafo.ListaAdyc.Select(v => new {
                v.info.numeroDato,
                v.info.nombreDato,
                aristas = v.ListaEnlaces.mostrarDatosColeccion().Select(a => new {
                    numeroDato = grafo.ListaAdyc[a.vertexNum].info.numeroDato,
                    nombreDato = grafo.ListaAdyc[a.vertexNum].info.nombreDato,
                    costo = a.costo
                })
            }));
            string script = $"console.log({verticesJson}); mostrarGrafo({verticesJson});";
            ClientScript.RegisterStartupScript(this.GetType(), "MostrarGrafo", script, true);
        }


        // Métodos que estaban dentro de ListBox3_SelectedIndexChanged ahora deben estar aquí fuera

        protected void btnOrdenTopologico_Click(object sender, EventArgs e)
        {
            List<int> orden = grafo.OrdenTopologico();
            ListBox4.Items.Clear();
            foreach (int v in orden)
            {
                ListBox4.Items.Add(v.ToString());
            }
        }

        protected void btnBuscarVerticeTopologico_Click(object sender, EventArgs e)
        {
            string script = "";
            if (txtVerticeBuscar.Text == "")
            {
                script = $"alert('No,has dado el Vértice para buscar');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            else
            {
                int vertice = int.Parse(txtVerticeBuscar.Text);
                int posicion = grafo.BuscarVerticeTopologico(vertice);
                TextBox3.Text = $"El Vértice:  { vertice} esta en la posición {posicion}";
                script = $"alert('El vértice {vertice} se encuentra en la posición {posicion} del orden topológico.');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            
        }

        protected void btnCaminoTopologico_Click(object sender, EventArgs e)
        {
            string script = "";
            if (txtOrigenTopologico.Text == "" || txtDestinoTopologico.Text == "")
            {
                script = $"alert('Te falta dar algun Vértice');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            else
            {
                int origen = int.Parse(txtOrigenTopologico.Text);
                int destino = int.Parse(txtDestinoTopologico.Text);
                List<int> camino = grafo.CaminoTopologico(origen, destino);
                ListBox5.Items.Clear();
                foreach (int v in camino)
                {
                    ListBox5.Items.Add(v.ToString());
                }
            }
            
        }

        protected void btnDijkstra_Click(object sender, EventArgs e)
        {
            string script = "";
            if (txtOrigenDijkstra.Text == "" || txtDestinoDijkstra.Text == "")
            {
                script = $"alert('Te falta dar algun Vértice');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            else
            {
                int origen = int.Parse(txtOrigenDijkstra.Text);
                int destino = int.Parse(txtDestinoDijkstra.Text);
                var (camino, costo) = grafo.Dijkstra(origen, destino);
                ListBox6.Items.Clear();
                foreach (int v in camino)
                {
                    ListBox6.Items.Add(v.ToString());
                }
                script = $"alert('El costo del camino más corto es: {costo}');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            
        }
        protected void btnDFS_Click(object sender, EventArgs e)
        {
            string script = "";
            if (txtDFS.Text == "")
            {
                script = $"alert('No has dado el Vértice para buscar');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            else
            {
                int startVertex = int.Parse(txtDFS.Text);
                List<int> recorridoDFS = grafo.DFS(startVertex);
                ListBoxDFS.Items.Clear();
                foreach (int v in recorridoDFS)
                {
                    ListBoxDFS.Items.Add(v.ToString());
                }
            }
        }
        protected void btnBFS_Click(object sender, EventArgs e)
        {
            string script = "";
            if (txtBFS.Text == "")
            {
                script = $"alert('No has dado el Vértice para buscar');";
                ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
            }
            else
            {
                int startVertex = int.Parse(txtBFS.Text);
                List<int> recorridoBFS = grafo.BFS(startVertex);
                ListBoxBFS.Items.Clear();
                foreach (int v in recorridoBFS)
                {
                    ListBoxBFS.Items.Add(v.ToString());
                }
            }
        }
    }
}