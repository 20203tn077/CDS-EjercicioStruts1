<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalRegister" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Nuevo cubo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form name="formCubeRegister" id="formCubeRegister" novalidate ng-submit="registerCube()">
                    <div class="row gy-3">
                        <div class="col-12 col-md-6">
                            <label class="form-label">SKU: <b>*</b></label>
                            <input autocomplete="false" required name="sku" type="text" class="form-control" ng-model="infoModal.sku">
                            <span class="invalid-feedback">{{validate('formCubeRegister', 'sku')}}</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Nombre: <b>*</b></label>
                            <input autocomplete="false" required name="name" type="text" class="form-control" ng-model="infoModal.name">
                            <span class="invalid-feedback">{{validate('formCubeRegister', 'name')}}</span>
                        </div>
                        <div class="col-12">
                            <label class="form-label">Descripción: <b>*</b></label>
                            <input autocomplete="false" required name="description" type="text" class="form-control" ng-model="infoModal.description">
                            <span class="invalid-feedback">{{validate('formCubeRegister', 'description')}}</span>
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Imagen: <b>*</b></label>
                            <input autocomplete="false" required name="image" type="url" class="form-control" ng-model="infoModal.image">
                            <span class="invalid-feedback">{{validate('formCubeRegister', 'image')}}</span>
                            <img ng-src="{{infoModal.image}}" class="img-thumbnail w-100 mt-3" ng-class="{'d-none': !infoModal.image || formCubeRegister.image.$error.url}" style="height: 150px; object-fit: cover">
                        </div>
                        <div class="col-12 col-md-6">
                            <label class="form-label">Segunda imagen: <b>*</b></label>
                            <input autocomplete="false" required name="image2" type="url" class="form-control" ng-model="infoModal.image2">
                            <span class="invalid-feedback">{{validate('formCubeRegister', 'image2')}}</span>
                            <img ng-src="{{infoModal.image2}}" class="img-thumbnail w-100 mt-3" ng-class="{'d-none': !infoModal.image2 || formCubeRegister.image2.$error.url}" style="height: 150px; object-fit: cover">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><i data-feather="x"></i>&nbsp;<span class="align-middle">Cerrar</span></button>
                <button type="submit" form="formCubeRegister" class="btn btn-primary"><i data-feather="check"></i>&nbsp;<span class="align-middle">Registrar</span></button>
            </div>
        </div>
    </div>
</div>