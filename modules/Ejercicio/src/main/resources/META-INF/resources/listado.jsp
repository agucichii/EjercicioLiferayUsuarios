<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />

<portlet:defineObjects />

<h1>Listado Registros</h1>

<p>
	<a href='<portlet:renderURL />'>Volver</a>
</p>


<table>
	<tr>
		<th>Nombre</th>
		<th>Apellido</th>
		<th>Nacimiento</th>
		<th>Correo</th>
	</tr>
	
	<c:forEach var='r' items='${registros}'>
		<tr>
			<td>${r.nombre}</td>
			<td>${r.apellido}</td>
			<td>${r.nacimiento}</td>
			<td>${r.correo}</td>
		</tr>
	</c:forEach>
</table>