package objects;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class TaskManager {
	
	public void updateTask(Task task)
	{
		String id = task.getID();
		//call database method and pass in new task object for the task id
	}
	
	public void updateTasks(List<Task> tasks)
	{
		for(Task task: tasks)
		{
			updateTask(task);
		}
	}
	
	public Map<String,List<Task>> randomAnonymousAssignmetn(List<String> users, List<Task> tasks)
	{
		Map<String,List<Task>> nameToTasks = new HashMap<String,List<Task>>();
		for(String user: users)
		{
			nameToTasks.put(user, new ArrayList<Task>());
		}
		
		Collections.shuffle(tasks);
		Iterator<Task> taskIt = tasks.iterator();
		
		int i = 0;
		String user = users.get(i);
		while(taskIt.hasNext())
		{
			List<Task> uTasks = nameToTasks.get(user);
			uTasks.add(taskIt.next());
			i = (i+1)%users.size();
		}
		
		return nameToTasks;
	}
	
    public void randomAssignment(ArrayList<User> users, Task task) {
    	
    		if(!users.isEmpty())
    		{
    			int minTasks = users.get(0).getTasklist().size();
	    		for(User user: users)
	    		{
	    			if(user.getTasklist().size() < minTasks)
	    			{
	    				minTasks = user.getTasklist().size();
	    			}
	    		}
	    		
	    		ArrayList<User> potential = new ArrayList<User>();
	    		for(User user: users)
	    		{
	    			if(user.getTasklist().size() == minTasks)
	    			{
	    				potential.add(user);
	    			}
	    		}
	    		
	    		potential.get((int)(Math.random() * potential.size())).assignTask(task);
    		}
    }

    public void addTaskToUser(User user, Task task) {
    		user.assignTask(task);
    }
    
    public void removeTask(Task task)
    {
    		//probably just call some databasemanager method to remove the task
    }
    
    public void removeTasks(List<Task> tasks)
    {
    		for(Task task: tasks)
    		{
    			removeTask(task);
    		}
    }
    
    public void assignTasks(Group group, List<Task> tasks)
    {
    		List<User> users = group.getUsers();
    		Collections.shuffle(tasks);
    		int maxTasks = users.get(0).getTasklist().size();
    		for(User user: users)
    		{
    			if(user.getTasklist().size() > maxTasks)
    			{
    				maxTasks = user.getTasklist().size();
    			}
    		}
    		
    		users.sort(new Comparator<User>() {

				@Override
				public int compare(User o1, User o2) {
					if(o1.getTasklist().size() < o2.getTasklist().size())
					{
						return -1;
					}
					else if(o1.getTasklist().size() > o2.getTasklist().size())
					{
						return 1;
					}
					return 0;
				}
    		});
    		
    		//goes throught the tasks and assigns them starting with the first user in the list
    		//if the index is the last in the array, 
    		int i = 0;
    		for(Task task: tasks)
    		{
    			users.get(i).assignTask(task);
    			if(i == users.size() - 1)
    			{
    				i = 0;
    			}
    			else if(users.get(i+1).getTasklist().size() > users.get(i).getTasklist().size())
    			{
    				i = 0;
    			}
    			else
    			{
    				i++;
    			}
    		}
    }
    
}


