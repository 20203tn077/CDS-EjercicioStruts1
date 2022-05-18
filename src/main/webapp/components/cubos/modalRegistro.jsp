<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalRegistro" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Nuevo cubo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form name="formRegistro" id="formRegistro" >
                    <div class="row gy-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">SKU: <b>*</b></label>
                            <input type="text" class="form-control" ng-model="infoModal.sku">
                            <span class="invalid-feedback">{{errors.sku}}</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Nombre: <b>*</b></label>
                            <input type="text" class="form-control" ng-model="infoModal.name">
                            <span class="invalid-feedback">{{errors.name}}</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Descripción: <b>*</b></label>
                            <input type="text" class="form-control" ng-model="infoModal.description">
                            <span class="invalid-feedback">{{errors.description}}</span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><i data-feather="x"></i>&nbsp;<span class="align-middle">Cerrar</span></button>
                <button type="submit" form="formRegistro" class="btn btn-primary"><i data-feather="check"></i>&nbsp;<span class="align-middle">Registrar</span></button>
            </div>
        </div>
    </div>
</div>