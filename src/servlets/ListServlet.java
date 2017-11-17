package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import managers.DBManager;
import objects.Group;
import objects.TaskList;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/ListServlet")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String req = request.getParameter("req");
		DBManager dbManager = DBManager.getInstance();
		
		if(req.equals("add")) {
			String name = request.getParameter("name");
			String items = request.getParameter("items");
			ArrayList<String> itemsArray = new ArrayList<String>();
			int last = 0;
			for(int i = 0; i < items.length(); ++i) {
				if(items.charAt(i) == ',') {
					if(i != last + 1) {
						String item = items.substring(last + 1, i);
						last = i;
					}else {
						last++;
					}
				}
			}
			
			if(!name.isEmpty() && itemsArray.size() != 0) {
				TaskList list = new TaskList();
				list.setName(name);
				list.setItems(itemsArray);
				Group g = (Group)request.getSession().getAttribute("Group");
				
				g.getLists().add(list);
				dbManager.addListToGroup(g.getGroupID(),list);
				response.getWriter().println("1");
			}else {
				response.getWriter().println("0");
			}
		}else if(req.equals("remove")){
			String ID = request.getParameter("ID");
			if(ID.isEmpty()) {
				response.getWriter().println("0");
			}else {
				Group g = (Group)request.getSession().getAttribute("Group");
				ArrayList<TaskList> lists = g.getLists();
				for(int i = 0; i < lists.size();++i) {
					if(lists.get(i).getID().equals(ID)) {
						lists.remove(i);
					}
				}
				dbManager.removeListFromGroup(g.getGroupID(),ID);
				response.getWriter().println("1");
			}
			
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
