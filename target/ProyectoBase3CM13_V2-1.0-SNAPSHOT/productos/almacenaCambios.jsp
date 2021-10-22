<%-- 
    Document   : almacenaCambios
    Created on : 17 oct 2021, 9:52:27
    Author     : JMTN
--%>
<%@page import="com.ipn.mx.modelo.dto.ProductoDTO"%>
<%@page import="com.ipn.mx.modelo.dao.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Almacenando datos</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            ProductoDAO dao = new ProductoDAO();
            ProductoDTO dto = new ProductoDTO();
            dto.getEntidad().setIdProducto(Integer.parseInt(request.getParameter("txtProducto")));
            dto.getEntidad().setNombreProducto(request.getParameter("txtNombreProducto"));
            dto.getEntidad().setDescripcionProducto(request.getParameter("txtDescripcionProducto"));
            dto.getEntidad().setPrecio(Float.parseFloat(request.getParameter("txtPrecio")));
            dto.getEntidad().setExistencia(Integer.parseInt(request.getParameter("txtExistencia")));
            dto.getEntidad().setStockMinimo(Integer.parseInt(request.getParameter("txtStock")));
            dto.getEntidad().setClaveCategoria(Integer.parseInt(request.getParameter("txtCategoria")));
            dao.update(dto);
        %>
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
            <center>
                <h1 class="text-primary">Datos modificados</h1>
                <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Información modificada</h5>
                    <p class="card-text"><%= dto.getEntidad().getNombreProducto()%></p>
                    <p class="card-text"><%= dto.getEntidad().getDescripcionProducto()%></p>
                    <p class="card-text"><%= dto.getEntidad().getPrecio()%></p>
                    <p class="card-text"><%= dto.getEntidad().getExistencia()%></p>
                    <p class="card-text"><%= dto.getEntidad().getStockMinimo()%></p>
                    <p class="card-text"><%= dto.getEntidad().getClaveCategoria() %></p>
                    <a href="./ListaDeProductos.jsp" class="btn btn-primary" alt="Lista de productos">Regresar</a>
                </div>
            </div>
            </center>
        </div>
    </body>
</html>
