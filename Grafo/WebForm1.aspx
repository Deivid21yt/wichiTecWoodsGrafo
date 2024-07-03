<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Grafo.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Grafo</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/main.css" />


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <section id="menu" class="menu section">

            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <p><span class="description-title">Grafo</span></p>
            </div>
            <!-- End Section Title -->

            <div class="container">

                <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="100">

                    <li class="nav-item">
                        <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
                            <h4>Agregar Vértices y Aristas</h4>
                        </a>
                    </li>
                    <!-- End tab nav item -->

                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
                            <h4>Mostrar Vértices </h4>
                        </a>
                        <!-- End tab nav item -->

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
                            <h4>Búsqueda Tipológica</h4>
                        </a>
                    </li>
                    <!-- End tab nav item -->

                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-dinner">
                            <h4>Reto Dijkstra</h4>
                        </a>
                    </li>
                    <!-- End tab nav item -->

                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-bfs">
                            <h4>DFS y BFS</h4>
                        </a>
                    </li>
                    <!-- End tab nav item -->



                </ul>

                <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

                    <div class="tab-pane fade active show" id="menu-starters">

                        <div class="tab-header text-center">
                            <h3>Agregar Vértices y Aristas</h3>
                        </div>

                        <div class="row gy-5">

                            <div class="col-lg-6 menu-item">
                                <h3><strong>Vértices</strong></h3>
                                Numero:<asp:TextBox ID="txttNumero" runat="server" Width="50px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp; Dato:<asp:TextBox ID="txtNombre" runat="server" Width="50px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAgregarVer" CssClass="btn btn-danger" runat="server" OnClick="btnAgregarVer_Click" Text="Agregar" Width="140px" Height="40px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                                <br />

                            </div>
                            <!-- Menu Item -->

                            <div class="col-lg-6 menu-item">
                                <h3><strong>Arista</strong></h3>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    Origen:<asp:TextBox ID="TextBox1" runat="server" Width="50px"></asp:TextBox>&nbsp;&nbsp;&nbsp; 
                    Destino:<asp:TextBox ID="TextBox2" runat="server" Width="50px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp; Costo:<asp:TextBox ID="txtCosto" runat="server" Width="50px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnAgregaArista" CssClass="btn btn-danger" runat="server" OnClick="btnAgregaArista_Click" Text="Agregar" Width="140px" Height="40px"/>
                                &nbsp;&nbsp;&nbsp;
                            </div>
                            <!-- Menu Item -->









                        </div>
                    </div>
                    <!-- End Starter Menu Content -->

                    <div class="tab-pane fade" id="menu-breakfast">

                        <div class="tab-header text-center">
                            <p>Muestra los vértices y selecciona para ver sus enlaces</p>

                        </div>

                        <div class="row gy-5">

                            <div class="col-lg-12 menu-item">

                               
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <asp:Button ID="btnMostrarVertice" CssClass="btn btn-success" runat="server" Height="40px" OnClick="btnMostrarVertice_Click" Text="Mostrar Vertices" Width="172px" />

                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ListBox ID="ListBox3" runat="server" Height="150px" Width="150px"></asp:ListBox>
                                        &nbsp;&nbsp;&nbsp;
                
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnMostrarAristas" CssClass="btn btn-success" runat="server" Text="Mostrar aristas" OnClick="btnMostrarAristas_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        <asp:ListBox ID="ListBox2" runat="server" Height="150px" Width="450px"></asp:ListBox>
                                        <br />
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>


                            </div>
                            <!-- Menu Item -->










                        </div>
                    </div>
                    <!-- End Breakfast Menu Content -->
                       

                    <div class="tab-pane fade" id="menu-lunch">

                        <div class="tab-header text-center">
                            <h3>Busqueda Topológica</h3>
                        </div>

                        <div class="row gy-5">

                            <div class="col-lg-4 menu-item">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                <h3>Orden Topológico</h3>
                                <asp:Button ID="btnOrdenTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnOrdenTopologico_Click" Text="Orden Topológico" />
                                <asp:ListBox ID="ListBox4" runat="server" Height="100px" Width="50px"></asp:ListBox>
                                        </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Menu Item -->

                            <div class="col-lg-4 menu-item">
                                  <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                <h3>Buscar Vértice en Orden Topológico</h3>
                                Vértice:<asp:TextBox ID="txtVerticeBuscar" runat="server" Width="50px"></asp:TextBox>
                                <asp:Button ID="btnBuscarVerticeTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnBuscarVerticeTopologico_Click" Text="Buscar Vértice" />
                                        <br />
                                        <br />
                                        <asp:TextBox ID="TextBox3" runat="server" Width="400px"></asp:TextBox>
                                         </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Menu Item -->

                            <div class="col-lg-4 menu-item">
                                 <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                <h3>Camino Topológico</h3>
                                Origen:
                    <asp:TextBox ID="txtOrigenTopologico" runat="server" Width="50px"></asp:TextBox>
                                Destino:
                    <asp:TextBox ID="txtDestinoTopologico" runat="server" Width="50px"></asp:TextBox>
                                <asp:Button ID="btnCaminoTopologico" CssClass="btn btn-warning" runat="server" OnClick="btnCaminoTopologico_Click" Text="Camino Topológico" />
                                        <br />
                                        <br />
                                <asp:ListBox ID="ListBox5" runat="server" Height="100px" Width="50px"></asp:ListBox>
                                        </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            
                            <!-- Menu Item -->





                        </div>
                    </div>
                    <!-- End Lunch Menu Content -->

                    <div class="tab-pane fade" id="menu-dinner">

                        <div class="tab-header text-center">
                            <h3>Camino Más Corto (Dijkstra)</h3>
                        </div>

                        <div class="row gy-5">

                            <div class="col-lg-12 menu-item">
                                Origen:
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                    <asp:TextBox ID="txtOrigenDijkstra" runat="server" Width="50px"></asp:TextBox>
                                Destino:
                    <asp:TextBox ID="txtDestinoDijkstra" runat="server" Width="50px"></asp:TextBox>
                                <asp:Button ID="btnDijkstra" CssClass="btn btn-primary" runat="server" OnClick="btnDijkstra_Click" Text="Buscar" />
                                <asp:ListBox ID="ListBox6" runat="server" Height="150px" Width="50px"></asp:ListBox>
                                         </ContentTemplate>
                                </asp:UpdatePanel>

                                <br />
                                <br />
                            </div>
                            <!-- Menu Item -->







                        </div>
                    </div>
                    <!-- End Dinner Menu Content -->


                    <div class="tab-pane fade" id="menu-bfs">

                        <div class="tab-header text-center">
                            
                            <h3> Recorrido DFS y BFS</h3>
                        </div>

                        <div class="row gy-5">

                            <div class="col-lg-6 menu-item">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                <h3>Recorrido en Profundidad (DFS)</h3>
                                Vértice Inicial:
                    <asp:TextBox ID="txtDFS" runat="server" Width="50px"></asp:TextBox>
                                <asp:Button ID="btnDFS" CssClass="btn btn-dark" runat="server" OnClick="btnDFS_Click" Text="Recorrer DFS" />
                                <br />
                                <br />
                                <asp:ListBox ID="ListBoxDFS" runat="server" Height="150px" Width="50px"></asp:ListBox>
                                         </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Menu Item -->

                            <div class="col-lg-6 menu-item">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                <h3>Recorrido en Amplitud (BFS)</h3>
                                Vértice Inicial:
                    <asp:TextBox ID="txtBFS" runat="server" Width="50px"></asp:TextBox>
                                <asp:Button ID="btnBFS" CssClass="btn btn-dark" runat="server" OnClick="btnBFS_Click" Text="Recorrer BFS" />
                                <br />
                                <br />
                                <asp:ListBox ID="ListBoxBFS" runat="server" Height="150px" Width="50px"></asp:ListBox>
                                        <br />
                                        <br />
                                        </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <!-- Menu Item -->







                        </div>
                    </div>
                    <!-- End Dinner Menu Content -->










                </div>
            </div>
            <!-- End Dinner Menu Content -->




            <div class="container p-5 my-5 border">
      
             <div class="col-lg-12 menu-item">

                 
                      <asp:Button ID="btnGrafo" CssClass="btn btn-info" runat="server" OnClick="btnGrafo_Click" Text="Ver Grafo" Width="186px" />
                                      
            <br />
                 <br />
                <canvas id="miCanvas" width="1200" height="800" style="border: 1px solid #000000;">Su navegador no soporta Canvas</canvas>
                <script type="text/javascript" src="JavaScript/Circulo.js"></script>
                <script type="text/javascript" src="JavaScript/Trigonometria.js"></script>
                <script type="text/javascript" src="JavaScript/Radar.js"></script>

                 </div>

               
                                        
            </div>
                  
             
             
    </section><!-- /Events Section -->


        <script src="js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
