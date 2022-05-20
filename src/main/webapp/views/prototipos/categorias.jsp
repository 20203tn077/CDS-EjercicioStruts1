<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String context = request.getContextPath();%>

<!DOCTYPE html>
<html lang="es" ng-app="pasteleria">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Struts 2 y Angular JS</title>
    <link href="<%=context%>/assets/css/pasteleria.css" rel="stylesheet">
    <script src="<%=context%>/assets/js/angular.js"></script>
    <script src="<%=context%>/assets/js/feather.js"></script>
</head>
<body class="bg-seashell">

<div ng-controller="pasteleriaController">
    <s:include value="/components/navbar.jsp">
        <s:param name="actualPage">prototipos</s:param>
    </s:include>

    <div class="container my-4 my-md-5">
        <div class="row">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header bg-blush text-white">
                        <div class="row">
                            <div class="col-auto"><h5 class="m-0" style="padding-block: 0.5rem">Sabores</h5></div>
                            <div class="col-auto ms-auto"><button ng-click="mostrarRegistro()" class="btn border-2 btn-outline-light"><i data-feather="plus"></i></button></div>
                        </div>
                    </div>
                    <div>
                    </div>
                    <div class="card-body">

                        <div class="table-responsive">
                            <table class="table table-seashell text-center">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Código</th>
                                    <th>Nombre</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody class="align-middle">
                                <tr ng-repeat="sabor in sabores">
                                    <th scope="row">{{$index+1}}</th>
                                    <td>{{sabor.code}}</td>
                                    <td>{{sabor.name}}</td>
                                    <td>
                                        <div class="row g-2 justify-content-center">
                                            <div class="col-auto">
                                                <button class="btn btn-pale"  ng-click="mostrarModificacion($index)"><i data-feather="edit"></i></button>
                                            </div>
                                            <div class="col-auto">
                                                <button class="btn btn-mauvelous" ng-click="mostrarEliminacion($index)"><i data-feather="trash-2"></i></button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <s:include value="/components/prototipos/categorias/modalRegistro.jsp"></s:include>
    <s:include value="/components/prototipos/categorias/modalModificacion.jsp"></s:include>
    <s:include value="/components/prototipos/categorias/modalEliminacion.jsp"></s:include>
    <s:include value="/components/loader.jsp"></s:include>
    <s:include value="/components/alert.jsp"></s:include>
</div>

<script src="<%=context%>/assets/js/bootstrap.js"></script>
<script>feather.replace()</script>
<script>
    const modalRegistro = new bootstrap.Modal(document.getElementById('modalRegistro'), {})
    const modalModificacion = new bootstrap.Modal(document.getElementById('modalModificacion'), {})
    const modalEliminacion = new bootstrap.Modal(document.getElementById('modalEliminacion'), {})
    const loader = new bootstrap.Modal('#loader', {backdrop: 'static', keyboard: false})
    const myAlert = new bootstrap.Toast('#alert', {delay: 3500})
    const app = angular.module('pasteleria', [])

    const flavors = [
        {
            code: 'S-01',
            name: 'Chocolate'
        },
        {
            code: 'S-02',
            name: 'Vainilla'
        },
        {
            code: 'S-03',
            name: 'Zarzamora'
        },
        {
            code: 'S-04',
            name: 'Fresa'
        },
        {
            code: 'S-05',
            name: 'Cajeta'
        },
        {
            code: 'S-06',
            name: 'Nuez'
        },
    ]

    app.controller('pasteleriaController', ($scope, $sce) => {
        $scope.loaderVariant = 'blush'
        $scope.sabores = flavors

        $scope.mostrarRegistro = (index) => {
            $scope.errors = {}
            $scope.infoRegistro = {}
            modalRegistro.show()
        }

        $scope.mostrarModificacion = (index) => {
            $scope.errors = {}
            $scope.infoModificacion = {...$scope.sabores[index], index: index}
            modalModificacion.show()
        }

        $scope.mostrarEliminacion = (index) => {
            $scope.errors = {}
            $scope.infoEliminacion = {...$scope.sabores[index], index: index}
            modalEliminacion.show()
        }

        $scope.registrar = () => {
            let errorCount = 0

            let error = !$scope.infoRegistro.code ? 'Campo obligatorio.' : null
            $scope.errors.code = error
            if (error) errorCount++

            error = !$scope.infoRegistro.name ? 'Campo obligatorio.' : null
            $scope.errors.name = error
            if (error) errorCount++

            if (errorCount == 0) {
                $scope.sabores.push({
                    code: $scope.infoRegistro.code,
                    name: $scope.infoRegistro.name
                })
                modalRegistro.hide()
                loader.show()
                setTimeout(() => {
                    loader.hide()
                }, 1500)
            }
        }

        $scope.modificar = (index) => {
            let errorCount = 0

            let error = !$scope.infoModificacion.name ? 'Campo obligatorio.' : null
            $scope.errors.name = error
            if (error) errorCount++

            if (errorCount == 0) {
                $scope.sabores[index] = {
                    ...$scope.sabores[index],
                    name: $scope.infoModificacion.name
                }
                modalModificacion.hide()
                loader.show()
                setTimeout(() => {
                    loader.hide()
                }, 1500)
            }
        }

        $scope.eliminar = (index) => {
            const saboresNuevo = $scope.sabores.filter((sabor, i) => i != index)
            $scope.sabores = saboresNuevo
            modalEliminacion.hide()
            loader.show()
            setTimeout(() => {
                loader.hide()
            }, 1500)
        }
    })

</script>
</body>
</html>