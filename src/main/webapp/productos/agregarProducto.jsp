<%-- 
    Document   : agregarProducto
    Created on : 17 oct 2021, 8:56:51
    Author     : JMTN
--%>

<%@page import="com.ipn.mx.modelo.dto.ProductoDTO"%>
<%@page import="com.ipn.mx.modelo.dao.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar nuevo producto</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            ProductoDAO dao = new ProductoDAO();
            ProductoDTO dto = new ProductoDTO();
            dto.getEntidad().setNombreProducto(request.getParameter("txtNombre"));
            dto.getEntidad().setDescripcionProducto(request.getParameter("txtDescripcion"));
            dto.getEntidad().setPrecio(Float.parseFloat(request.getParameter("txtPrecio")));
            dto.getEntidad().setExistencia(Integer.parseInt(request.getParameter("txtExistencia")));
            dto.getEntidad().setStockMinimo(Integer.parseInt(request.getParameter("txtStock")));
            dto.getEntidad().setClaveCategoria(Integer.parseInt(request.getParameter("txtCategoria")));
            dao.create(dto);
            response.sendRedirect("ListaDeProductos.jsp");
        %>
    </body>
</html>
