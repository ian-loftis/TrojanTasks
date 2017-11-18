package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import managers.DBManager;

/**
 * Servlet implementation class ModifyGroup
 */
@WebServlet("/ModifyGroup")
public class ModifyGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyGroup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("req");
		String userEmail = request.getParameter("email");
		DBManager dbManager = DBManager.getInstance();
		
		boolean success = false;
		if(type.equals("join")) {
			String groupid = request.getParameter("groupid");
			success = dbManager.addUserToGroup(groupid,userEmail,request.getSession());
		}else if(type.equals("create")) {
			String gname = request.getParameter("gname");
			success = dbManager.addUserToNewGroup(userEmail,gname,request.getSession());
		}else if(type.equals("leave")) {
			success = dbManager.removeGroupFromUser(userEmail,request.getSession());
		}
		
		if(success) {
			response.getWriter().println("1");
		}else {
			response.getWriter().println("0");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
