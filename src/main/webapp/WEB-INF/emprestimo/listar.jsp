<!-- JSTL -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<tag:layout title="${titulo}">
 
<jsp:attribute name="header">

	<c:set var="path" value="${pageContext.request.contextPath}" scope="request" />
	
	<style type="text/css">
	
		@import url("${path}/assets/bootstrap/css/bootstrap.min.css");
		
		@import url("${path}/assets/bootstrap/css/bootstrap-theme.min.css");
		
		@import url("${path}/assets/bootstrap/css/bootstrap-toggle.min.css");
		
		@import url("${path}/assets/css/select2.min.css");
		
		#btn-inserir {
			margin-bottom: 8px;
		}
		
		.select2 {
			width:100%!important;
		}
		
		.checkbox-nice {
    position: relative;
    padding-left: 15px;
    
	}
	.checkbox-nice input[type=checkbox] {
	    visibility: hidden;
	}
	.checkbox-nice label {
	    padding-top: 3px;
	}
	.checkbox-nice.checkbox-inline>label {
	    margin-left: 16px;
	}
	.checkbox-nice label:before {
	    cursor: pointer;
	    position: absolute;
	    width: 22px;
	    height: 22px;
	    left: 1px;
	    top: 1px;
	    background: #ffffff;
	    content: "";
	    border: 1px solid #a62b32;
	    border-radius: 3px;
	    background-clip: padding-box;
	}
	.checkbox-nice label:after {
	    opacity: 0;
	    content: '';
	    position: absolute;
	    width: 12px;
	    height: 7px;
	    background: transparent;
	    top: 7px;
	    left: 6px;
	    border: 3px solid #a62b32;
	    border-top: none;
	    border-right: none;
	    -webkit-transform: rotate(-45deg);
	    -ms-transform: rotate(-45deg);
	    transform: rotate(-45deg);
	}
	.checkbox-nice label:hover::after {
	    opacity: 0.3;
	}
	.checkbox-nice input[type=checkbox]:checked+label:after {
	    opacity: 1;
	}
		
	</style>

</jsp:attribute>
 
<jsp:attribute name="body">

	<div class="container">

		<jsp:include page="../menu.jsp"></jsp:include>

		<c:if test="${not empty mensagensErro}">

			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

				<h3>Ops, ocorrem os seguintes erros:</h3>

				<c:forEach items="${mensagensErro}" var="mensagem">

					<p>
						<strong>${mensagem.getField()}</strong>
						${mensagem.getDefaultMessage()}
					</p>

				</c:forEach>

			</div>

		</c:if>

		<c:if test="${not empty mensagemSucesso}">

			<div class="alert alert-success alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

				<h3>${mensagemSucesso}</h3>

			</div>

		</c:if>

		<button type="button" id="btn-inserir" class="btn btn-primary"
			data-toggle="modal" data-target="#modal-add-edit" data-tipo="Inserir">
			<span class="glyphicon glyphicon-plus"></span> Realizar novo emprestimo
		</button>

		<section id="section-table">

			<jsp:include page="table-listar.jsp"></jsp:include>

		</section>

	</div>

</jsp:attribute>

<jsp:attribute name="footer">

	<script type="text/javascript"
		src="${path}/assets/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript"
		src="${path}/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${path}/assets/bootstrap/js/bootstrap-toggle.min.js"></script>
	<script src="http://chancejs.com/chance.min.js"></script>
	<script type="text/javascript" src="${path}/assets/js/modal-request.js"></script>
	<script type="text/javascript" src="${path}/assets/js/select2.full.min.js"></script>

	<jsp:include page="modal-add-edit.jsp"></jsp:include>

</jsp:attribute>
 
</tag:layout>