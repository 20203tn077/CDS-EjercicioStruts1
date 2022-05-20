<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String context = request.getContextPath();%>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Struts 2 y Angular JS</title>
  <link href="<%=context%>/assets/css/pasteleria.css" rel="stylesheet">
  <script src="<%=context%>/assets/js/angular.js"></script>
  <script src="<%=context%>/assets/js/feather.js"></script>
</head>
<body class="bg-seashell">

<s:include value="/components/navbar.jsp">
  <s:param name="actualPage">prototipos</s:param>
</s:include>

<div class="container my-4 my-md-5">
  <div class="row">
    <div class="col">
      <div class="card shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Prototipos</h5>
          <p class="card-text">En esta página se encuentran los prototipos</p>
          <div class="row g-2">
            <div class="col-auto">
              <a class="btn btn-mauvelous" href="<s:url action="categorias" namespace="prototipos"/>">Categorías</a>
            </div>
            <div class="col-auto">
              <a class="btn btn-mauvelous" href="<s:url action="productos" namespace="prototipos"/>">Productos</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="<%=context%>/assets/js/bootstrap.js"></script>
<script>feather.replace()</script>
</body>
</html>