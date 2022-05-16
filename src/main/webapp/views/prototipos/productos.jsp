<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String context = request.getContextPath();%>

<!DOCTYPE html>
<html lang="es" ng-app="pasteleria">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Struts 2 y Angular JS</title>
    <link href="<%=context%>/assets/css/bootstrap.css" rel="stylesheet">
    <script src="<%=context%>/assets/js/angular.js"></script>
    <script src="<%=context%>/assets/js/feather.js"></script>
</head>
<body ng-controller="pasteleriaController">

<div>
    <s:include value="/components/navbar.jsp">
        <s:param name="actualPage">prototipos</s:param>
    </s:include>

    <div class="container mt-5">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header bg-dark text-white">
                        <div class="row">
                            <div class="col-auto"><h5 class="m-0" style="padding-block: 0.5rem">Pasteles</h5></div>
                            <div class="col-auto ms-auto"><button class="btn btn-success"><i data-feather="plus"></i></button></div>
                        </div>
                    </div>
                    <div>
                    </div>
                    <div class="card-body">

                        <div class="table-responsive">
                            <table class="table table-striped">
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
                                    <td>{{pastel.codigo}}</td>
                                    <td>{{pastel.nombre}}</td>
                                    <td>{{pastel.sabor}}</td>
                                    <td>{{pastel.precio | currency}}</td>
                                    <td>{{pastel.cantidad}}</td>
                                    <td>
                                        <button class="btn btn-primary"><i data-feather="edit"></i></button>
                                        <button class="btn btn-danger" ng-click="mostrarEliminacion($index)"><i data-feather="trash-2"></i></button>
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
</div>

<script src="<%=context%>/assets/js/bootstrap.js"></script>
<script>feather.replace()</script>
<script>
    const app = angular.module('pasteleria', [])

    const pasteles = [
        {
            codigo: 'P-374',
            nombre: 'Pastel Chocoamaretto',
            sabor: 'Vainilla',
            precio: 236,
            cantidad: 7
        },
        {
            codigo: 'P-294',
            nombre: 'Pastel Rous',
            sabor: 'Zarzamora',
            precio: 253,
            cantidad: 2
        },
        {
            codigo: 'P-984',
            nombre: 'Pastel Xoccolat',
            sabor: 'Chocolate',
            precio: 354,
            cantidad: 2
        },
        {
            codigo: 'P-123',
            nombre: 'Pastel de Chocolate con Chocolate',
            sabor: 'Chocolate',
            precio: 458,
            cantidad: 4
        },
        {
            codigo: 'P-234',
            nombre: 'Pastel de Fresa',
            sabor: 'Fresa',
            precio: 2,
            cantidad: 450
        },
        {
            codigo: 'P-568',
            nombre: 'Pastel de Queso con Chocolate',
            sabor: 'Chocolate',
            precio: 500,
            cantidad: 7
        },
    ]

    app.controller('pasteleriaController', ($scope) => {
        const modalRegistro = new bootstrap.Modal(document.getElementById('modalRegistro'), {})
        const modalModificacion = new bootstrap.Modal(document.getElementById('modalModificacion'), {})
        const modalEliminacion = new bootstrap.Modal(document.getElementById('modalEliminacion'), {})
        $scope.pasteles = pasteles

        $scope.mostrarRegistro = (index) => {
            $scope.infoRegistro = $scope.pasteles[index]
        }

        $scope.mostrarModificacion = (index) => {
            $scope.infoModificacion = $scope.pasteles[index]
        }

        $scope.mostrarEliminacion = (index) => {
            $scope.infoEliminacion = {...$scope.pasteles[index], index: index}
            modalEliminacion.show()
        }

        $scope.eliminar = (index) => {
            const pastelesNuevo = $scope.pasteles.filter((pastel, i) => i != index)
            $scope.pasteles = pastelesNuevo
            modalEliminacion.hide()
        }
    })

</script>
</body>
</html>