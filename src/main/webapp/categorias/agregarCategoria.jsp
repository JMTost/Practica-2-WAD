<%-- 
    Document   : agregarCategoría
    Created on : 7 oct 2021, 7:30:14
    Author     : JMTN
--%>

<%@page import="com.ipn.mx.modelo.dto.CategoriaDTO"%>
<%@page import="com.ipn.mx.modelo.dao.CategoriaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar nueva categoría</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            CategoriaDAO dao = new CategoriaDAO();
            CategoriaDTO dto = new CategoriaDTO();
            dto.getEntidad().setNombreCategoria(request.getParameter("txtNombre"));
            dto.getEntidad().setDescripcionCategoria(request.getParameter("txtDescripcion"));
            dao.create(dto);
            response.sendRedirect("ListaDeCategorias.jsp");
        %>
    </body>
</html>
