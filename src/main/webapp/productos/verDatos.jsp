<%-- 
    Document   : verDatos
    Created on : 17 oct 2021, 9:08:01
    Author     : JMTN
--%>

<%@page import="com.ipn.mx.modelo.dto.ProductoDTO"%>
<%@page import="com.ipn.mx.modelo.dao.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver datos del producto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="../index.jsp">Proyecto base 3CM13</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="../index.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../tablasDeMultiplicar.jsp">Tablas de multiplicar</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../categorias/ListaDeCategorias.jsp">Listado de categorias</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./ListaDeProductos.jsp">Listado de productos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <%
                ProductoDAO dao = new ProductoDAO();
                ProductoDTO dto = new ProductoDTO();
                dto.getEntidad().setIdProducto(Integer.parseInt(request.getParameter("id")));
                dto = dao.read(dto);

                if (dto != null) {
            %>
            <div class="card border-primary">
                <div class="card-header">
                    <h1>Lista de productos</h1>
                </div>
                <div class="card-body text-primary">
                    <table class="table table-striped">
                        <tr>
                            <th>Clave de producto</th>
                            <td><%= dto.getEntidad().getIdProducto()%></td>
                        </tr>
                        <tr>
                            <th>Nombre de producto</th>
                            <td><%= dto.getEntidad().getNombreProducto()%></td>
                        </tr>
                        <tr>
                            <th>Descripción del producto</th>
                            <td><%= dto.getEntidad().getDescripcionProducto()%></td>
                        </tr>
                        <tr>
                            <th>Precio del producto</th>
                            <td><%= dto.getEntidad().getPrecio()%></td>
                        </tr>
                        <tr>
                            <th>Existencia del producto</th>
                            <td><%= dto.getEntidad().getExistencia()%></td>
                        </tr>
                        <tr>
                            <th>Stock del producto</th>
                            <td><%= dto.getEntidad().getStockMinimo()%></td>
                        </tr>
                        <tr>
                            <th>Clave de categoría</th>
                            <td><%= dto.getEntidad().getClaveCategoria()%></td>
                        </tr>
                    </table>
                </div>
                <a href="ListaDeProductos.jsp" class="btn btn-warning">Regresar</a>
                <div>

                    <%
                    } else {
                        //marcar error
                        //out.println("Sin valores a mostrar");

                    %>
                    <center>
                        <h1>Error al recuperar el dato</h1>
                        <a href="./ListaDeProductos.jsp" alt="Regresar al listado de productos" class="btn btn-primary">Regresar</a>
                    </center>
                    <%                        }
                    %>
                </div>
                </body>
                </html>
