package jsonObjects;

import java.util.List;

import objects.Task;

public class UpdateTasksRequest 
{
	String type;
	List<Task> tasks;
	
	public UpdateTasksRequest(String type, List<Task> tasks)
	{
		this.type = type;
		this.tasks = tasks;
	}
	
	public void setType(String type)
	{
		this.type = type;
	}
	
	public String getType()
	{
		return type;
	}
	
	public void setTasks(List<Task> tasks)
	{
		this.tasks = tasks;
	}
	
	public List<Task> getTasks()
	{
		return tasks;
	}

}
