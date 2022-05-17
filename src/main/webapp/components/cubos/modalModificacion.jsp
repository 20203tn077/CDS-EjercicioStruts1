<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalModificacion" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Sabor {{infoModificacion.code}}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row gy-3">
                    <div class="col-12">
                        <label class="form-label">Nombre: <b>*</b></label>
                        <input type="text" class="form-control" ng-model="infoModificacion.name">
                        <span class="invalid-feedback">{{errors.name}}</span>
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