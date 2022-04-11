package com.ricoh.portlet;

import com.ricoh.constants.Portlet1PortletKeys;
import com.ricoh.service.model.Registro;
import com.ricoh.service.service.RegistroLocalServiceUtil;

import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import com.liferay.adaptive.media.exception.AMRuntimeException.IOException;
import com.liferay.counter.kernel.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.util.ParamUtil;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.portlet.annotations.ServeResourceMethod;

import org.osgi.service.component.annotations.Component;

/**
 * @author Agustin Cicchitti
 */
@Component(
		immediate = true,
		property = {
			"com.liferay.portlet.display-category=category.sample",
			"com.liferay.portlet.header-portlet-css=/css/main.css",
			"com.liferay.portlet.instanceable=true",
			"javax.portlet.display-name=Portlet1",
			"javax.portlet.init-param.template-path=/",
			"javax.portlet.init-param.view-template=/view.jsp",
			"javax.portlet.name=" + Portlet1PortletKeys.PORTLET1,
			"javax.portlet.resource-bundle=content.Language",
			"javax.portlet.security-role-ref=power-user,user"
		},
		service = Portlet.class
	)
	public class Portlet1Portlet extends MVCPortlet {
						
			
			public void registroPersona(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException, PortletException {
				String nombre=ParamUtil.getString(actionRequest, "nombre","");
				String apellido=ParamUtil.getString(actionRequest, "apellido","");
				String nacimiento=ParamUtil.getString(actionRequest, "nacimiento","");
				String correo=ParamUtil.getString(actionRequest, "correo","");
				
				Registro reg=RegistroLocalServiceUtil.createRegistro(
						CounterLocalServiceUtil.increment(Registro.class.getName())
						);
				
				reg.setNombre(nombre);
				reg.setApellido(apellido);
				reg.setNacimiento(nacimiento);
				reg.setCorreo(correo);
						
				RegistroLocalServiceUtil.addRegistro(reg);
			}
		
			
		
		@Override
		public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
			String jspPage=ParamUtil.get(renderRequest, "jspPage","");
			if(jspPage.equals("/listado.jsp")) {
				List<Registro> registros=RegistroLocalServiceUtil.getRegistros(-1, -1);
				
				
				renderRequest.setAttribute("registros",registros);
			}			
			try {
				super.render(renderRequest, renderResponse);
			} catch (java.io.IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}