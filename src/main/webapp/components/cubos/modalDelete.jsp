<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalDelete" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Eliminar cubo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                ¿Deseas eliminar el cubo <b>{{infoModal.name}}</b>?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><i data-feather="x"></i>&nbsp;<span class="align-middle">Cerrar</span></button>
                <button ng-click="deleteCube()" type="button" class="btn btn-primary"><i data-feather="trash-2"></i>&nbsp;<span class="align-middle">Eliminar</span></button>
            </div>
        </div>
    </div>
</div>