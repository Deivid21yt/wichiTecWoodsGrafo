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
            string[] aristas = null;
            List<string> aristas2 = null;
            if (ListBox3.SelectedIndex != -1)
            {
                posiVertx = ListBox3.SelectedIndex;
                aristas = grafo.mostrarAristasVertice(posiVertx, ref msj);
                //string script = $"alert('{msj}');";
                //ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                //Mostrar informacion de las aristas
                ListBox1.Items.Clear();
                foreach (string w in aristas)
                {
                    ListBox1.Items.Add(w);
                }
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
            var verticesJson = JsonConvert.SerializeObject(grafo.ListaAdyc.Select(v => new { v.info.numeroDato, v.info.nombreDato }));
            string script = $"mostrarGrafo({verticesJson});";
            ClientScript.RegisterStartupScript(this.GetType(), "MostrarGrafo", script, true);
        }

        protected void ListBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string msj = "";
            int posiVertx = -5;
            string[] aristas = null;
            List<string> aristas2 = null;
            if (ListBox3.SelectedIndex != -1)
            {
                posiVertx = ListBox3.SelectedIndex;
                aristas = grafo.mostrarAristasVertice(posiVertx, ref msj);
                //string script = $"alert('{msj}');";
                //ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
                //Mostrar informacion de las aristas
                ListBox1.Items.Clear();
                foreach (string w in aristas)
                {
                    ListBox1.Items.Add(w);
                }
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
    }
}