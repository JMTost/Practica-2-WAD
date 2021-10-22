<%-- 
    Document   : ListaDeCategorias
    Created on : 4 oct 2021, 7:17:03
    Author     : JMTN
--%>

<%@page import="com.ipn.mx.modelo.dto.ProductoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.ipn.mx.modelo.dao.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="../index.jsp">HOME</a>
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
            <div class="card border-primary">
                <div class="card-header">
                    <h1>Lista de productos</h1>
                </div>
                <div class="card-body text-primary">
                    <table class="table table-striped">
                        <tr>
                            <th>Clave producto</th>
                            <th>Nombre producto</th>
                            <th>Descripción producto</th>
                            <th>Precio producto</th>
                            <th>Existencia</th>
                            <th>Stock</th>
                            <th>Clave categoría</th>
                            <th>Eliminar</th>
                            <th>Actualizar</th>
                        </tr><!--Directiva-->
                        <%
                            ProductoDAO dao = new ProductoDAO();
                            List lista = dao.readAll();
                            if (lista != null) {
                                for (int i = 0; i < lista.size(); i++) {
                                    ProductoDTO cat = (ProductoDTO) lista.get(i);
                        %>     
                        <tr>
                            <td> <a href="verDatos.jsp?id=<%= cat.getEntidad().getIdProducto()%>" class="btn btn-warning"><%= cat.getEntidad().getIdProducto()%></a> </td>
                            <td> <%= cat.getEntidad().getNombreProducto()%> </td>
                            <td> <%= cat.getEntidad().getDescripcionProducto()%> </td>
                            <td> <%= cat.getEntidad().getPrecio() %> </td>
                            <td> <%= cat.getEntidad().getExistencia() %> </td>
                            <td> <%= cat.getEntidad().getStockMinimo()%> </td>
                            <td> <%= cat.getEntidad().getClaveCategoria()%> </td>
                            <td> <a href="eliminar.jsp?id=<%= cat.getEntidad().getIdProducto()%>" class="btn btn-danger">Eliminar</a> </td>
                            <td> <a href="actualizar.jsp?id=<%= cat.getEntidad().getIdProducto()%>" class="btn btn-success">Actualizar</a> </td>
                        </tr>
                        <%      }
                        } else {
                        %>
                        <h1>No se encontró información en la base de datos</h1>
                        <%
                            }%>
                    </table>
                </div>
                    <a href="nuevoProducto.jsp" class="btn btn-primary">Nuevo</a>
            <div>
        </div>
    </body>
</html>