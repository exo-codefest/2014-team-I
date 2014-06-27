package org.exoplatform.addons.codefest.team_i;

import java.io.IOException;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

public class TaskManagementPortlet extends GenericPortlet {
    @Override
    protected void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
        getPortletContext().getRequestDispatcher("/index.jsp").include(request, response);
    }
}
