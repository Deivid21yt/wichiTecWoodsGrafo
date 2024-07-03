<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Grafo.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Grafo</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
        function mostrarGrafo(grafo) {
            // Aquí puedes implementar la lógica para mostrar el grafo en el frontend usando JavaScript
            console.log(grafo);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <h1 class="text-center">Grafo</h1>
        <div class="container p-5 my-5 border">
            <div class="row">
                <div class="col">
                    <h3>Agregar vertices</h3>
                    Numero:
                    <asp:TextBox ID="txttNumero" runat="server" Width="60px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dato:
                    <asp:TextBox ID="txtNombre" runat="server" Width="60px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAgregarVer" CssClass="btn btn-danger" runat="server" OnClick="btnAgregarVer_Click" Text="Agregar" Width="138px" Height="40px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;
                    <br />
                    
                    <h3>Agregar Aristas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h3>
                    &nbsp;Vértices:<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Origen:
                    <asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp; Destino:
                    <asp:TextBox ID="TextBox2" runat="server" Width="50px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    &nbsp;Costo:
                  &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCosto" runat="server" Width="67px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAgregaArista" CssClass="btn btn-danger" runat="server" OnClick="btnAgregaArista_Click" Text="Agregar A" />
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnMostrarVertice" CssClass="btn btn-success" runat="server" Height="40px" OnClick="btnMostrarVertice_Click" Text="Mostrar Vertices" Width="172px" />
                    <br />
                    <br />
                    Seleciona el Vértice para ver sus Aristas<br />
                    <br />
                    <asp:ListBox ID="ListBox3" runat="server" Height="155px" Width="167px" OnSelectedIndexChanged="ListBox3_SelectedIndexChanged"></asp:ListBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnMostrarAristas" CssClass="btn btn-success" runat="server" Text="Mostrar aristas" OnClick="btnMostrarAristas_Click" />
                    <br />
                    <br />
                    <br />
                    <asp:ListBox ID="ListBox1" runat="server" Width="394px"></asp:ListBox>
                    <br />
                    <asp:ListBox ID="ListBox2" runat="server" Width="393px"></asp:ListBox>
                    <br />

                    <h3>Orden Topológico</h3>
                    <asp:Button ID="btnOrdenTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnOrdenTopologico_Click" Text="Orden Topológico" />
                    <asp:ListBox ID="ListBox4" runat="server"></asp:ListBox>

                    <h3>Buscar Vértice en Orden Topológico</h3>
                    Vértice:
                    <asp:TextBox ID="txtVerticeBuscar" runat="server" Width="60px"></asp:TextBox>
                    <asp:Button ID="btnBuscarVerticeTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnBuscarVerticeTopologico_Click" Text="Buscar Vértice" />

                    <h3>Camino Topológico</h3>
                    Origen:
                    <asp:TextBox ID="txtOrigenTopologico" runat="server" Width="60px"></asp:TextBox>
                    Destino:
                    <asp:TextBox ID="txtDestinoTopologico" runat="server" Width="60px"></asp:TextBox>
                    <asp:Button ID="btnCaminoTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnCaminoTopologico_Click" Text="Camino Topológico" />
                    <asp:ListBox ID="ListBox5" runat="server"></asp:ListBox>

                    <h3>Camino Más Corto (Dijkstra)</h3>
                    Origen:
                    <asp:TextBox ID="txtOrigenDijkstra" runat="server" Width="60px"></asp:TextBox>
                    Destino:
                    <asp:TextBox ID="txtDestinoDijkstra" runat="server" Width="60px"></asp:TextBox>
                    <asp:Button ID="btnDijkstra" CssClass="btn btn-primary" runat="server" OnClick="btnDijkstra_Click" Text="Camino Más Corto" />
                    <asp:ListBox ID="ListBox6" runat="server"></asp:ListBox>
                </div>

                <div class="col">
                    <h3>Dibujar Grafo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h3>
                    <br />
                    <asp:Button ID="btnGrafo" CssClass="btn btn-info" runat="server" OnClick="btnGrafo_Click" Text="Ver Grafo" Width="186px" />
                    <br />
                    <br />
                    <canvas id="miCanvas" width="350" height="350" style="border: 1px solid #000000;">Su navegador no soporta Canvas</canvas>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="JavaScript/Circulo.js"></script>
        <script type="text/javascript" src="JavaScript/Trigonometria.js"></script>
        <script type="text/javascript" src="JavaScript/Radar.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
