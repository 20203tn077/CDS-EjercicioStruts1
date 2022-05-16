<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalModificacion" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Pastel {{infoModificacion.code}}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row gy-3">
                    <div class="col-12 col-md-6">
                        <label class="form-label">Nombre: <b>*</b></label>
                        <input type="text" class="form-control" ng-model="infoModificacion.name">
                        <span class="invalid-feedback">{{errors.name}}</span>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label">Sabor: <b>*</b></label>
                        <select class="form-select" ng-options="sabor as sabor.name for sabor in sabores track by sabor.code" ng-model="infoModificacion.flavor">
                        </select>
                        <span class="invalid-feedback">{{errors.flavor}}</span>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label">Precio: <b>*</b></label>
                        <input type="number" step="any" class="form-control" ng-model="infoModificacion.price">
                        <span class="invalid-feedback">{{errors.price}}</span>
                    </div>
                    <div class="col-12 col-md-6">
                        <label class="form-label">Cantidad: <b>*</b></label>
                        <input type="number" class="form-control" ng-model="infoModificacion.amount">
                        <span class="invalid-feedback">{{errors.amount}}</span>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-pale" data-bs-dismiss="modal"><i data-feather="x"></i>&nbsp;<span class="align-middle">Cerrar</span></button>
                <button type="button" class="btn btn-dark" ng-click="modificar(infoModificacion.index)"><i data-feather="check"></i>&nbsp;<span class="align-middle">Guardar cambios</span></button>
            </div>
        </div>
    </div>
</div>