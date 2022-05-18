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
    <style>
        .overlay {
            opacity: 0;
            transition: .25s ease;
        }
        .cubeContainer:hover .overlay {
            opacity: 1;
        }
    </style>
</head>
<body>

<div ng-controller="cubeController">
    <s:include value="/components/navbar.jsp">
        <s:param name="actualPage">cubos</s:param>
    </s:include>

    <div class="container my-4 my-md-5">
        <div class="row g-4">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Cubos</h5>
                        <p class="card-text">Esta es una página de prueba en la que se muestra el funcionamiento de una
                            aplicación web desarrollada en Struts.</p>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="row g-3">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3" ng-repeat="cube in cubes">
                        <div class="card shadow h-100 cubeContainer">
                            <div class="card-header bg-primary text-white">
                                <div class="row">
                                    <div class="col">
                                        <h5 class="m-0 align">{{cube.sku}} {{cube.name}}</h5>
                                    </div>
                                    <div class="col-auto ms-auto">
                                        <i ng-click="mostrarModificacion($index)" role="button" data-feather="edit"></i>
                                        <i ng-click="mostrarEliminacion($index)" role="button" data-feather="trash-2"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center position-relative" style="height: 150px">
                                <img ng-src="{{cube.image}}" class="h-100 px-3 pt-3">
                                <div class="position-absolute top-0 start-0 h-100 w-100 bg-white overlay">
                                    <img ng-src="{{cube.image2}}" class="h-100 px-3 pt-3">
                                </div>
                            </div>
                            <div class="card-body">
                                <p class="card-text">{{cube.description}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button ng-click="mostrarRegistro()" class="btn btn-primary p-0" style="width: 50px; height: 50px; border-radius: 25px; position: fixed; bottom: 40px; right: 40px;">
        <div class="position-relative h-100 w-100">
            <i class="align-middle position-absolute top-50 start-50 translate-middle" style="width: 30px; height: 30px" data-feather="plus"></i>
        </div>
    </button>
    <s:include value="/components/cubos/modalRegistro.jsp"></s:include>
    <s:include value="/components/cubos/modalModificacion.jsp"></s:include>
    <s:include value="/components/cubos/modalEliminacion.jsp"></s:include>
    <s:include value="/components/loader.jsp"></s:include>
    <s:include value="/components/alert.jsp"></s:include>
</div>

<script src="<%=context%>/assets/js/bootstrap.js"></script>
<script>feather.replace()</script>
<script>
    const modalRegistro = new bootstrap.Modal('#modalRegistro', {})
    const modalModificacion = new bootstrap.Modal('#modalModificacion', {})
    const modalEliminacion = new bootstrap.Modal('#modalEliminacion', {})
    const loader = new bootstrap.Modal('#loader', {backdrop: 'static', keyboard: false})
    const myAlert = new bootstrap.Toast('#alert', {delay: 3500})

    const cubes = JSON.parse('${cubes}')
    const app = angular.module('cubeStore', [])

    app.controller('cubeController', ($scope, $sce) => {
        $scope.vali

        $scope.cubes = cubes

        $scope.alertType = 'success'
        $scope.alertMessage = 'Ocurrió un  lkj lj lj ljklas hkahskjahskdjh as pouasfdoiusdof usoiduf oisuadofi psoid fproblema'
        $scope.alertIcon = $sce.trustAsHtml(feather.icons['check-circle'].toSvg() + '&nbsp;')
        myAlert.show()

        $scope.mostrarRegistro = () => {
            $scope.infoModal = {}
            modalRegistro.show()
        }

        $scope.mostrarModificacion = (index) => {
            $scope.infoModal = {...cubes[index]}
            modalModificacion.show()
        }

        $scope.mostrarEliminacion = (index) => {
            $scope.infoModal = {...cubes[index]}
            modalEliminacion.show()
        }
    })
</script>
</body>
</html>