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
    <button ng-click="showCubeRegister()" class="btn btn-primary p-0" style="width: 50px; height: 50px; border-radius: 25px; position: fixed; bottom: 40px; right: 40px;">
        <div class="position-relative h-100 w-100">
            <i class="align-middle position-absolute top-50 start-50 translate-middle" style="width: 30px; height: 30px" data-feather="plus"></i>
        </div>
    </button>
    <s:include value="/components/cubos/modalRegister.jsp"></s:include>
    <s:include value="/components/cubos/modalUpdate.jsp"></s:include>
    <s:include value="/components/cubos/modalDelete.jsp"></s:include>
    <s:include value="/components/loader.jsp"></s:include>
    <s:include value="/components/alert.jsp"></s:include>
</div>

<script src="<%=context%>/assets/js/bootstrap.js"></script>
<script>feather.replace()</script>
<script>
    const modalRegisterElement = document.getElementById('modalRegister')
    const modalUpdateElement = document.getElementById('modalUpdate')
    const modalDeleteElement = document.getElementById('modalDelete')
    const modalRegister = new bootstrap.Modal(modalRegisterElement, {})
    const modalUpdate = new bootstrap.Modal(modalUpdateElement, {})
    const modalDelete = new bootstrap.Modal(modalDeleteElement, {})
    loaderElement = document.getElementById('loader')
    const loader = new bootstrap.Modal(loaderElement, {backdrop: 'static', keyboard: false})
    const myAlert = new bootstrap.Toast('#alert', {delay: 3500})

    const cubes = JSON.parse('${cubes}')
    const baseURL = '<%=context%>/cubeapi/'
    const app = angular.module('cubeStore', [])

    app.controller('cubeController', ($scope, $sce, $http, $timeout) => {
        $scope.error = {}
        $scope.validate = (form, input, values) => {
            if ($scope.error[input]) return $scope.error[input]
            if ($scope[form][input].$pristine && !$scope[form].$submitted) return ''
            const error = $scope[form][input].$error
            if (error.required) return 'Campo obligatorio.'
            if (error.number) return 'Ingresa un número valido.'
            if (error.datetimelocal) return 'Ingresa una fecha y hora válidas.'
            if (error.time) return 'Ingresa una hora válida.'
            if (error.date) return 'Ingresa una fecha válida.'
            if (error.week) return 'Ingresa una semana válida.'
            if (error.month) return 'Ingresa un mes válido.'
            if (error.max) return values.type && values.type === 'fecha' ? ('Ingresa una fecha que no sea posterior a ' + values.max + '.') : ('Ingresa un valor dentro del rango' + values.min && values.max ? (' (' + values.min + ' - ' + values.max + ')') : '' + '.')
            if (error.min) return values.type && values.type === 'fecha' ? ('Ingresa una fecha que no sea inferior a ' + values.min + '.') : ('Ingresa un valor dentro del rango' + values.min && values.max ? (' (' + values.min + ' - ' + values.max + ')') : '' + '.')
            if (error.maxLength) return values.max ? 'Máximo ' + values.max + ' carácteres.' : 'Has excedido el máximo de carácteres.'
            if (error.minLength) return values.max ? 'Mínimo ' + values.max + ' carácteres.' : 'No cumples con el mínimo de carácteres.'
            if (error.email) return 'Ingresa un correo válido.'
            if (error.pattern) return values.type ? ('Ingresa un' + values.gender || '' + ' ' + values.type + ' válid' + values.gender || '' + '.') : 'Ingresa un valor con el formato correcto.'
            if (error.url) return 'Ingresa una URL válida.'
            return ''
        }

        $scope.cubes = cubes

        $scope.showCubeRegister = () => {
            $scope.infoModal = {}
            $scope.formCubeRegister.$setPristine()
            modalRegister.show()
        }

        $scope.showCubeUpdate = (index) => {
            $scope.infoModal = {...cubes[index]}
            $scope.formModificacion.$setPristine()
            modalModificacion.show()
        }

        $scope.showCubeDelete = (index) => {
            $scope.infoModal = {...cubes[index]}
            $scope.formEliminacion.$setPristine()
            modalEliminacion.show()
        }

        $scope.registerCube = async () => {
            if ($scope.formCubeRegister.$valid) {
                await new Promise(resolve => {
                    let finished = false
                    modalRegisterElement.addEventListener('hidden.bs.modal', () => {
                        if (finished) resolve()
                        else finished = true
                    })
                    loaderElement.addEventListener('shown.bs.modal', () => {
                        if (finished) resolve()
                        else finished = true
                    })
                    modalRegister.hide()
                    loader.show()
                })
                $http({
                    method: 'POST',
                    url: baseURL + 'registerCube',
                    data: {
                        cube: $scope.infoModal
                    }
                }).then(({data: res}) => {
                    if (!res.error) {
                        $scope.cubes.push({...$scope.infoModal})
                    }

                    loader.hide()
                    if (res.error) modalRegister.show()

                    $scope.alertType = res.error ? 'danger' : 'success'
                    $scope.alertMessage = res.status
                    $scope.alertIcon = $sce.trustAsHtml(feather.icons[res.error ? 'alert-triangle' : 'check-circle'].toSvg() + '&nbsp;')
                    $timeout(() => {
                        myAlert.show()
                    })
                }, () => {
                    loader.hide()
                    $scope.alertType = 'danger'
                    $scope.alertMessage = 'No se pudo establecer conexión con el servidor.'
                    $scope.alertIcon = $sce.trustAsHtml(feather.icons['alert-triangle'].toSvg() + '&nbsp;')
                    $timeout(() => {
                        myAlert.show()
                    })
                });
            }
        }
    })
</script>
</body>
</html>