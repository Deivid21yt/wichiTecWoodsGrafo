<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Grafo.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Grafo</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <h1 class="text-center">Grafo</h1>
        <div class="container p-5 my-5 border">

            <div class="row">
                <div class="col">
                    <h3>Agregar Vértices</h3>
                    Numero:<asp:TextBox ID="txttNumero" runat="server" Width="50px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp; Dato:<asp:TextBox ID="txtNombre" runat="server" Width="50px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAgregarVer" CssClass="btn btn-danger" runat="server" OnClick="btnAgregarVer_Click" Text="Agregar" Width="138px" Height="40px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <div />
                    <div class="col">
                        <h3>Agregar Aristas</h3>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    Origen:<asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>&nbsp;&nbsp;&nbsp; 
                    Destino:<asp:TextBox ID="TextBox2" runat="server" Width="50px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp; Costo:<asp:TextBox ID="txtCosto" runat="server" Width="50px"></asp:TextBox>
                        <br />
                        <br />
                    <asp:Button ID="btnAgregaArista" CssClass="btn btn-danger" runat="server" OnClick="btnAgregaArista_Click" Text="Agregar A" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnMostrarVertice" CssClass="btn btn-success" runat="server" Height="40px" OnClick="btnMostrarVertice_Click" Text="Mostrar Vertices" Width="172px" />
                    <br />
                        <br />
                        Seleciona el Vértice para ver sus Aristas<br />
                        <br />
                        <asp:ListBox ID="ListBox3" runat="server" Height="150px" Width="170px"></asp:ListBox>
                        &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnMostrarAristas" CssClass="btn btn-success" runat="server" Text="Mostrar aristas" OnClick="btnMostrarAristas_Click" />
                        <br />
                        <br />
                        <asp:ListBox ID="ListBox1" runat="server" Height="150px" Width="250px"></asp:ListBox>
                        <asp:ListBox ID="ListBox2" runat="server" Height="150px" Width="250px"></asp:ListBox>
                        <br />
                        <br />
                    </div>
                    <div />

                    <div class="row">
                        <div class="col">
                            <h3>Orden Topológico</h3>
                            <asp:ListBox ID="ListBox4" runat="server" Height="100px" Width="150px"></asp:ListBox>
                            <asp:Button ID="btnOrdenTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnOrdenTopologico_Click" Text="Orden Topológico" />
                        </div>
                        <div class="col">
                            <h3>Buscar Vértice en Orden Topológico</h3>
                            Vértice:
                    <asp:TextBox ID="txtVerticeBuscar" runat="server" Width="50px"></asp:TextBox>
                            <asp:Button ID="btnBuscarVerticeTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnBuscarVerticeTopologico_Click" Text="Buscar Vértice" />
                        </div>
                        <div class="col">
                            <h3>Camino Topológico</h3>
                            Origen:
                    <asp:TextBox ID="txtOrigenTopologico" runat="server" Width="50px"></asp:TextBox>
                            Destino:
                    <asp:TextBox ID="txtDestinoTopologico" runat="server" Width="50px"></asp:TextBox>
                            <asp:Button ID="btnCaminoTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnCaminoTopologico_Click" Text="Camino Topológico" />
                            <asp:ListBox ID="ListBox5" runat="server" Height="100px" Width="250px"></asp:ListBox>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h3>Camino Más Corto (Dijkstra)</h3>
                            Origen:
                    <asp:TextBox ID="txtOrigenDijkstra" runat="server" Width="50px"></asp:TextBox>
                            Destino:
                    <asp:TextBox ID="txtDestinoDijkstra" runat="server" Width="50px"></asp:TextBox>
                            <asp:Button ID="btnDijkstra" CssClass="btn btn-primary" runat="server" OnClick="btnDijkstra_Click" Text="Camino Más Corto" />
                            <asp:ListBox ID="ListBox6" runat="server" Height="150px" Width="250px"></asp:ListBox>
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h3>Recorrido en Profundidad (DFS)</h3>
                            Vértice Inicial:
                    <asp:TextBox ID="txtDFS" runat="server" Width="50px"></asp:TextBox>
                            <asp:Button ID="btnDFS" CssClass="btn btn-primary" runat="server" OnClick="btnDFS_Click" Text="Recorrer DFS" />
                            <asp:ListBox ID="ListBoxDFS" runat="server" Height="150px" Width="250px"></asp:ListBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h3>Recorrido en Amplitud (BFS)</h3>
                            Vértice Inicial:
                    <asp:TextBox ID="txtBFS" runat="server" Width="50px"></asp:TextBox>
                            <asp:Button ID="btnBFS" CssClass="btn btn-primary" runat="server" OnClick="btnBFS_Click" Text="Recorrer BFS" />
                            <asp:ListBox ID="ListBoxBFS" runat="server" Height="150px" Width="250px"></asp:ListBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <h3>Dibujar Grafo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h3>
                            <br />
                            <asp:Button ID="btnGrafo" CssClass="btn btn-info" runat="server" OnClick="btnGrafo_Click" Text="Ver Grafo" Width="186px" />
                            <br />
                            <br />
                            <br />
                            <canvas id="miCanvas" width="500" height="500" style="border: 1px solid #000000;">Su navegador no soporta Canvas</canvas>
                            <script type="text/javascript" src="JavaScript/Circulo.js"></script>
                            <script type="text/javascript" src="JavaScript/Trigonometria.js"></script>
                            <script type="text/javascript" src="JavaScript/Radar.js"></script>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
