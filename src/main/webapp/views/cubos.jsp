<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String context = request.getContextPath();%>

<!DOCTYPE html>
<html lang="es" ng-app="cubeStore">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Struts 2 y Angular JS</title>
    <link href="<%=context%>/assets/css/bootstrap.css" rel="stylesheet">
    <script src="<%=context%>/assets/js/angular.js"></script>
    <script src="<%=context%>/assets/js/feather.js"></script>
</head>
<body>

<div ng-controller="cubeController">
    <s:include value="/components/navbar.jsp">
        <s:param name="actualPage">cubos</s:param>
    </s:include>

    <div class="container mt-5">
        <div class="row">
            <div class="col">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Cubos</h5>
                        <p class="card-text">Esta es una página de prueba en la que se muestra el funcionamiento de una
                            aplicación web desarrollada en Struts.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3" ng-repeat="cube in cubes">
                        <div class="card shadow-sm">
                            <div class="card-header bg-blush text-white">
                                <div class="row">
                                    <div class="col-auto"><h5 class="m-0" style="padding-block: 0.5rem">Pasteles</h5></div>
                                    <div class="col-auto ms-auto"><button ng-click="mostrarRegistro()" class="btn border-2 btn-outline-light"><i data-feather="plus"></i></button></div>
                                </div>
                            </div>
                            <img ng-src="{{cube.image}}" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title"><b>{{cube.sku}}</b> - {{cube.name}}</h5>
                                <p class="card-text">{{cube.description}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <s:include value="/components/cubos/modalRegistro.jsp"></s:include>
    <s:include value="/components/cubos/modalModificacion.jsp"></s:include>
    <s:include value="/components/cubos/modalEliminacion.jsp"></s:include>
    <s:include value="/components/loader.jsp"></s:include>
</div>

<script src="<%=context%>/assets/js/bootstrap.js"></script>
<script>feather.replace()</script>
<script>
    const modalRegistro = new bootstrap.Modal('#modalRegistro', {})
    const modalModificacion = new bootstrap.Modal('#modalModificacion', {})
    const modalEliminacion = new bootstrap.Modal('#modalEliminacion', {})
    const loader = new bootstrap.Modal('#loader', {backdrop: 'static', keyboard: false})

    loader.show()
    const cubes = JSON.parse('${cubes}')
    const app = angular.module('cubeStore', [])

    app.controller('cubeController', ($scope) => {
        $scope.cubes = cubes


    })
</script>
</body>
</html>