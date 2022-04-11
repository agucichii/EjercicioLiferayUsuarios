<%@ include file="/init.jsp" %>

<portlet:renderURL var='registro'>
	<portlet:param name='jspPage' value='/registro.jsp' />
</portlet:renderURL>

<portlet:renderURL var='listado'>
	<portlet:param name='jspPage' value='/listado.jsp' />
</portlet:renderURL>

<ul>
<li><a href='${registro}'>Formulario Registro</a></li>
<li><a href='${listado}'>Listado Registros</a></li>
</ul>