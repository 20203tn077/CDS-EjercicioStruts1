<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="actualPage">
    ${param.actualPage}
</s:set>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="<s:url action='inicio'/>">Struts 2 y Angular JS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link <s:if test="#actualPage == 'inicio'">active</s:if>" href="<s:url action="inicio" namespace=""/>">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <s:if test="#actualPage == 'calculadora'">active</s:if>" href="<s:url action="calculadora" namespace=""/>">Calculadora</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <s:if test="#actualPage == 'cubos'">active</s:if>" href="<s:url action="cubos" namespace=""/>">Cubos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <s:if test="#actualPage == 'prototipos'">active</s:if>" href="<s:url action="prototipos" namespace=""/>">Prototipos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>