package servlets;


import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Enumeration;

import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import jsonObjects.UpdateTasksRequest;
import objects.Group;
import objects.TaskManager;
import objects.User;

@WebServlet("/updateTasks")
@MultipartConfig()
public class UpdateTasks extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		if(session == null || session.getId() == null)
		{
			//forward to login page
		}
		
		User user = (User) session.getAttribute("user");
		if(user == null)
		{
			//do something to handle
		}
		
		Group group = (Group) session.getAttribute("group");
		if(group == null)
		{
			//do something to handle
		}
		
		
		System.out.println("Post to update tasks");
		//should check content type to ensure that it's json, but for now will forego in favor
		//of actually building functionality
		Enumeration<String > attributeNames = request.getAttributeNames();
		Enumeration<String> parameterNames = request.getParameterNames();
		try {
			
			ServletInputStream sis = request.getInputStream();
			InputStreamReader isr = new InputStreamReader(sis);
			Gson gson = new Gson();
			
			
			UpdateTasksRequest utr;
			utr = gson.fromJson(isr,UpdateTasksRequest.class);
			System.out.println("Type: " + utr.getType());
			System.out.println("Tasks: ");
			
			if(utr.getType().equalsIgnoreCase("assign"))
			{
				TaskManager tm = new TaskManager();
				tm.assignTasks(group, utr.getTasks());
				//was the code when there was a different jsonObject class for tasks in requests,
				//currently using the regular Task object and having the front end send
				//complete information instead of accepting incomplete information
//				ArrayList<Task> tasksToAssign = new ArrayList<Task>();
//				for(RequestTask rt: utr.getTasks())
//				{
//					Task task = new Task(rt.getName(), rt.getDescription(),null);
//					tasksToAssign.add(task);
//				}
//				tm.assignTasks(group, tasksToAssign);
			}
			else if(utr.getType().equalsIgnoreCase("update"))
			{
				TaskManager tm = new TaskManager();
				if(!utr.getTasks().isEmpty())
				{
					tm.updateTasks(utr.getTasks());
				}
			}
			else if(utr.getType().equalsIgnoreCase("remove"))
			{
				TaskManager tm = new TaskManager();
				if(!utr.getTasks().isEmpty())
				{
					tm.removeTasks(utr.getTasks());
				}
			}
			else if(utr.getType().equalsIgnoreCase(""))
			{
				
			}
			
			
//			System.out.println("input:");
//			System.out.println(sis.toString());
//			while(!sis.isFinished())
//			{
//				System.out.print((char)(sis.read()));
//			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Parameter Names: ");
		while(parameterNames.hasMoreElements())
		{
			System.out.println(parameterNames.nextElement());
		}
		
		System.out.println("Attribute Names: ");
		while(attributeNames.hasMoreElements())
		{
			System.out.println(attributeNames.nextElement());
		}
		
		
//		try {
//			Collection<Part> parts = request.getParts();
//			for(Part part: parts)
//			{
//				System.out.println(part.getName() + ": " + part.getContentType());
//			}
//		} 
//		catch (IOException e) 
//		{
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
//		catch (ServletException e) 
//		{
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("Get on update tasks");
	}
}
