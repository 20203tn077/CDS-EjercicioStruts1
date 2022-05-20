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
                            <div class="col-auto"><h5 class="m-0" style="padding-block: 0.5rem">Pasteles</h5></div>
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
                                    <th>Sabor</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Acciones</th>
                                </tr>
                                </thead>
                                <tbody class="align-middle">
                                <tr ng-repeat="pastel in pasteles">
                                    <th scope="row">{{$index+1}}</th>
                                    <td>{{pastel.code}}</td>
                                    <td class="text-start">{{pastel.name}}</td>
                                    <td>{{pastel.flavor.name}}</td>
                                    <td>{{pastel.price | currency}}</td>
                                    <td>{{pastel.amount}}</td>
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

    <s:include value="/components/prototipos/productos/modalRegistro.jsp"></s:include>
    <s:include value="/components/prototipos/productos/modalModificacion.jsp"></s:include>
    <s:include value="/components/prototipos/productos/modalEliminacion.jsp"></s:include>
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
    const cakes = [
        {
            code: 'P-374',
            name: 'Pastel Chocoamaretto',
            flavor: {
                code: 'S-02',
                name: 'Vainilla'
            },
            price: 236,
            amount: 7
        },
        {
            code: 'P-294',
            name: 'Pastel Rous',
            flavor: {
                code: 'S-03',
                name: 'Zarzamora'
            },
            price: 253,
            amount: 2
        },
        {
            code: 'P-984',
            name: 'Pastel Xoccolat',
            flavor: {
                code: 'S-01',
                name: 'Chocolate'
            },
            price: 354,
            amount: 2
        },
        {
            code: 'P-123',
            name: 'Pastel de Chocolate con Chocolate',
            flavor: {
                code: 'S-01',
                name: 'Chocolate'
            },
            price: 458,
            amount: 4
        },
        {
            code: 'P-234',
            name: 'Pastel de Fresa',
            flavor: {
                code: 'S-04',
                name: 'Fresa'
            },
            price: 2,
            amount: 450
        },
        {
            code: 'P-568',
            name: 'Pastel de Queso con Chocolate',
            flavor: {
                code: 'S-01',
                name: 'Chocolate'
            },
            price: 500,
            amount: 7
        },
    ]

    app.controller('pasteleriaController', ($scope, $sce, $timeout) => {
        $scope.loaderVariant = 'blush'
        $scope.pasteles = cakes
        $scope.sabores = [
            {
                name: 'Selecciona una opción...',
                code: ''
            },
            ...flavors
        ]

        $scope.mostrarRegistro = (index) => {
            $scope.errors = {}
            $scope.infoRegistro = {flavor: $scope.sabores[0]}
            modalRegistro.show()
        }

        $scope.mostrarModificacion = (index) => {
            $scope.errors = {}
            $scope.infoModificacion = {...$scope.pasteles[index], index: index}
            modalModificacion.show()
        }

        $scope.mostrarEliminacion = (index) => {
            $scope.infoEliminacion = {...$scope.pasteles[index], index: index}
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

            error = !$scope.infoRegistro.flavor.code ? 'Campo obligatorio.' : null
            $scope.errors.flavor = error
            if (error) errorCount++

            error = !$scope.infoRegistro.price ? 'Campo obligatorio.' : null
            $scope.errors.price = error
            if (error) errorCount++

            error = !$scope.infoRegistro.amount ? 'Campo obligatorio.' : null
            $scope.errors.amount = error
            if (error) errorCount++

            if (errorCount == 0) {
                $scope.pasteles.push({
                    code: $scope.infoRegistro.code,
                    name: $scope.infoRegistro.name,
                    flavor: {
                        code: $scope.infoRegistro.flavor.code,
                        name: $scope.infoRegistro.flavor.name
                    },
                    price: $scope.infoRegistro.price,
                    amount: $scope.infoRegistro.amount
                })
                modalRegistro.hide()
                loader.show()
                setTimeout(() => {
                    loader.hide()
                    $scope.alertType = 'orchid'
                    $scope.alertMessage = 'Pastel registrado :)'
                    $scope.alertIcon = $sce.trustAsHtml(feather.icons['check-circle'].toSvg() + '&nbsp;')
                    $timeout(() => {
                        myAlert.show()
                    })
                }, 1500)
            }
        }

        $scope.modificar = (index) => {
            let errorCount = 0

            error = !$scope.infoModificacion.name ? 'Campo obligatorio.' : null
            $scope.errors.name = error
            if (error) errorCount++

            error = !$scope.infoModificacion.flavor.code ? 'Campo obligatorio.' : null
            $scope.errors.flavor = error
            if (error) errorCount++

            error = !$scope.infoModificacion.price ? 'Campo obligatorio.' : null
            $scope.errors.price = error
            if (error) errorCount++

            error = !$scope.infoModificacion.amount ? 'Campo obligatorio.' : null
            $scope.errors.amount = error
            if (error) errorCount++

            if (errorCount == 0) {
                $scope.pasteles[index] = {
                    ...$scope.pasteles[index],
                    name: $scope.infoModificacion.name,
                    flavor: {
                        code: $scope.infoModificacion.flavor.code,
                        name: $scope.infoModificacion.flavor.name
                    },
                    price: $scope.infoModificacion.price,
                    amount: $scope.infoModificacion.amount
                }
                modalModificacion.hide()
                loader.show()
                setTimeout(() => {
                    loader.hide()
                    $scope.alertType = 'orchid'
                    $scope.alertMessage = 'Pastel modificado :)'
                    $scope.alertIcon = $sce.trustAsHtml(feather.icons['check-circle'].toSvg() + '&nbsp;')
                    $timeout(() => {
                        myAlert.show()
                    })
                }, 1500)
            }
        }

        $scope.eliminar = (index) => {
            const pastelesNuevo = $scope.pasteles.filter((pastel, i) => i != index)
            $scope.pasteles = pastelesNuevo
            modalEliminacion.hide()
            loader.show()
            setTimeout(() => {
                loader.hide()
                $scope.alertType = 'orchid'
                $scope.alertMessage = 'Pastel eliminado :)'
                $scope.alertIcon = $sce.trustAsHtml(feather.icons['check-circle'].toSvg() + '&nbsp;')
                $timeout(() => {
                    myAlert.show()
                })
            }, 1500)

        }
    })

</script>
</body>
</html>