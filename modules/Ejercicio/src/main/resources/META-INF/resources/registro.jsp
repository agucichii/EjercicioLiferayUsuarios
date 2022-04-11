<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/captcha" prefix="liferay-captcha" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<liferay-theme:defineObjects />

<portlet:defineObjects />


<h1>Formulario Registro</h1>

<p>
	<a href='<portlet:renderURL />'>Volver</a>
</p>

<p>
<portlet:actionURL name="registroPersona" var="registroPersonaURL"/>
<portlet:resourceURL id="captcha" var="captchaResourceURL"/>

<div style="position:relative; margin: 30px 0 0 0;">
<form method="post" action="${registroPersonaURL}">
	<div class="col-12">
    	<label for="nombre" class="form-label">Nombre</label>
    	<input name="<portlet:namespace/>nombre" type="text" class="form-control" id="nombre">
  	</div>
	<div class="col-12">
    	<label for="apellido" class="form-label">Apellido</label>
    	<input name="<portlet:namespace/>apellido" type="text" class="form-control" id="apellido">
  	</div>  	
	<div class="col-12">
		<label for="nacimiento" class="form-label">Fecha de Nacimiento</label> 
		<input type="date" class="form-control" id="date" name="<portlet:namespace/>nacimiento" required />
	</div>
	<div class="col-12">
    	<label for="email" class="form-label">Email</label>
    	<input name="<portlet:namespace/>correo" type="email" class="form-control" id="email">
  	</div>
  	
  	<br>
	<div>
	<button type="submit" class="btn btn-primary" name="action"
			value="Enviar">Save</button>	
	</div>
			
</form>
</div>