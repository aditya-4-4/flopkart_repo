package com.iiitb.ooadvoid;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import com.iiitb.ooadvoid.pojo.FlopkartUser;
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final AccessProperties ap = new AccessProperties();
	public static String BASE_URI = ap.getServerURL();
	public static final String PATH_NAME = "flopkartPrototype/webapi/users/update/";

	@Override
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
		String itemName = "";
		String ID = "";

		try
		{
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<?> items = null;
			items = upload.parseRequest(request);
			Iterator<?> itr = items.iterator();
			while (itr.hasNext())
			{
				FileItem item = (FileItem) itr.next();
				if (item.isFormField())
				{
					String name = item.getFieldName();
					if (name.equalsIgnoreCase("ID"))
					{
						ID = (String) item.getString();
					}
				}
				else
				{
					itemName = item.getName();

					item.write(new File(ap.getServerPath() + itemName));
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		Client client = ClientBuilder.newClient();

		WebTarget target = client.target(BASE_URI+PATH_NAME+ID);
		FlopkartUser user = new FlopkartUser();
		user.setPic_URL(itemName);
		target.request(MediaType.APPLICATION_JSON).put(Entity.entity(user, MediaType.APPLICATION_JSON));
		response.sendRedirect("myProfile.jsp?imgName="+itemName);
	}
}
