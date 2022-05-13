<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String context = request.getContextPath();%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Struts 2 y Angular JS</title>
    <link href="<%=context%>/assets/css/bootstrap.css" rel="stylesheet">
    <script src="<%=context%>/assets/js/angular.js"></script>
    <script src="<%=context%>/assets/js/feather.js"></script>
</head>
<body>

<s:include value="/components/navbar.jsp">
    <s:param name="actualPage">calculadora</s:param>
</s:include>

<div class="container mt-5">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Calculadora</h5>
                    <p class="card-text">Esta es una página de prueba en la que se muestra el funcionamiento de una
                        aplicación web desarrollada en Struts.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=context%>/assets/js/bootstrap.js"></script>
<script>feather.replace()</script>
</body>
</html>