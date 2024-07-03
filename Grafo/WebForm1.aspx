<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Grafo.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Grafo</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container p-5 my-5 border">
            <h1 class="text-center">Grafo</h1>
            <div class="row">
                <div class="col">
                    <h3>Agregar vertices</h3>
                    <p>
                    Numero:
                    <asp:TextBox ID="txttNumero" runat="server" Width="68px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAgregarVer" CssClass="btn btn-danger" runat="server" OnClick="btnAgregarVer_Click" Text="Agregar" Width="138px" Height="40px" />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                    Dato:
                    <asp:TextBox ID="txtNombre" runat="server" Width="68px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;
                    <br />
                    </p>
                    <h3>Agregar Aristas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h3>
&nbsp;Vértices:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Origen: <asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnAgregaArista" CssClass="btn btn-danger" runat="server" OnClick="btnAgregaArista_Click" Text="Agregar A" />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp; Destino: <asp:TextBox ID="TextBox2" runat="server" Width="50px"></asp:TextBox>
                    <br />
                    <br />
&nbsp;Costo:
                  &nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtCosto" runat="server" Width="67px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnMostrarVertice" CssClass="btn btn-success" runat="server" Height="40px" OnClick="btnMostrarVertice_Click" Text="Mostrar Vertices" Width="172px" />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <br />
                    <br />
                    Seleciona el Vértice para ver sus Aristas<br />
                    <br />
                    <asp:ListBox ID="ListBox3" runat="server" Height="155px" Width="219px" OnSelectedIndexChanged="ListBox3_SelectedIndexChanged"></asp:ListBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnMostrarAristas" CssClass="btn btn-success" runat="server" Text="Mostrar aristas" OnClick="btnMostrarAristas_Click" />
                    <br />
                    <br />
                    <br />
                    <asp:ListBox ID="ListBox1" runat="server" Width="394px"></asp:ListBox>
                    <br />
                    <asp:ListBox ID="ListBox2" runat="server" Width="393px"></asp:ListBox>
                    <br />
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
