<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div role="alert" class="toast" id="alert" style="z-index: 1090; position: fixed; top: 30px; right: 30px;">
  <div class="alert m-0" role="alert" ng-class="alertType ? ('alert-' + alertType) : ''">
    <div class="row">
      <div class="col">
        <span ng-bind-html="alertIcon"></span>
        <span class="align-middle">{{alertMessage}}</span>
      </div>
      <div class="col-auto">
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>
</div>