<%-- 
    Document   : actualizar
    Created on : 7 oct 2021, 8:01:58
    Author     : JMTN
--%>

<%@page import="com.ipn.mx.modelo.dto.CategoriaDTO"%>
<%@page import="com.ipn.mx.modelo.dao.CategoriaDAO"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar información</title>
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
                                <a class="nav-link active" aria-current="page" href="../index.jsp">Index</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../tablasDeMultiplicar.jsp">Tablas de multiplicar</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="./ListaDeCategorias.jsp">Listado de categorias</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <%
                CategoriaDAO dao = new CategoriaDAO();
                CategoriaDTO dto = new CategoriaDTO();
                dto.getEntidad().setIdCategoria(Integer.parseInt(request.getParameter("id")));
                dto = dao.read(dto);

                if (dto != null) {
            %>

            <div class="mb-3">
                <div class="card border-success">
                    <div class="card-header">
                        <h1 class="text-primary text-center">Actualizar categoría</h1> 
                    </div>
                    <div class="card-body">
                        <form method="POST" action="almacenarCambios.jsp" enctype="multipart/from-data" accept-charset="utf-8">
                            <div class="mb-3">
                                <label class="form-label">Clave de la categoría</label>
                                <input type="text" class="form-control" name="txtClave" id="txtClave"  maxlength="30" required="required" value="<%= dto.getEntidad().getIdCategoria()%>" readonly="true" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nombre de la categoría</label>
                                <input type="text" class="form-control" name="txtNombre" id="txtNombre"  maxlength="30" required="required" value="<%= dto.getEntidad().getNombreCategoria()%>" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Descripción de la categoría</label>
                                <input type="text" class="form-control" name="txtDescripcion" id="txtDescripcion"  maxlength="100" required="required" value="<%= dto.getEntidad().getDescripcionCategoria()%>" />
                            </div>
                            <button type="submit" class="btn btn-success">Actualizar categoría</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
            } else {
                //error>
            %>
            <center>
                <h1>Error al recuperar el dato</h1>
                <a href="./ListaDeCategorias.jsp" alt="Regresar al listado de categorias" class="btn btn-primary">Regresar</a>
            </center>
            <%
                }
            %>
        </div>

    </body>
</html>
