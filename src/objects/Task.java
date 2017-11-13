package objects;

public class Task {

    String name;
    String description;
    Integer ID;
    boolean completed;
    
    public Task()
    {
    		
    }
    
    public Task(String name, String description, Integer ID)
    {
    		this.name=  name;
    		this.description = description;
    		this.ID = ID;
    		this.completed = false;
    }
    
    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public Integer getID() {
        return ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }
    
    public void setCompleted(boolean completed)
    {
    		this.completed = completed;
    }
    
    public boolean getCompleted()
    {
    		return completed;
    }
}
