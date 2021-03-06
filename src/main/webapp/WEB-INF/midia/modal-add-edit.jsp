<!-- JSTL -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Modal -->
<%@ taglib prefix="tagModal" tagdir="/WEB-INF/tags"%>

<tagModal:modal url="${url}">

	<jsp:attribute name="modal_csrf_token">

	<input type="hidden" id="csrf" name="_csrf" value="${_csrf.token}">

</jsp:attribute>

	<jsp:attribute name="modal_body">

	<div class="form-group">

	<input type="hidden" class="form-control" id="id" name="id">

	<label for="titulo" class="control-label">Título:</label>
	<input type="text" class="form-control" id="titulo" name="titulo">
				
	<label for="dataDeGravacao" class="control-label">Data de gravação:</label>
	<input type="date" class="form-control" id="dataDeGravacao"
				name="dataDeGravacao" required> 
	
	<label for="tipo" class="control-label">tipo:</label>
		<select class="form-control" id="tipo" name="tipo" required>

			<c:forEach items="${tipos}" var="tipo">
				<option value="${tipo}">${tipo}</option>
			</c:forEach>
		</select>
		
	<tagModal:form_item_acervo></tagModal:form_item_acervo>
	
</div>
	
</jsp:attribute>

</tagModal:modal>
