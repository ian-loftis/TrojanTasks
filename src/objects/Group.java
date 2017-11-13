package objects;

import java.util.ArrayList;

public class Group {

    private String groupID;
    private ArrayList<User> users;
    private ArrayList<TaskList> lists;
    private ArrayList<Calendar> calendars;
    private String name;
    
    

    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	void addUser(int id) {}
    void removeUser(int id) {}
    void addList(String name) {}
    void removeList(String name) {}

    public String getGroupID() {
        return groupID;
    }
    public void setGroupID(String groupID) {
        this.groupID = groupID;
    }
    public ArrayList<User> getUsers() {
        return users;
    }
    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }
    public ArrayList<TaskList> getLists() {
        return lists;
    }
    public void setLists(ArrayList<TaskList> lists) {
        this.lists = lists;
    }
    public ArrayList<Calendar> getCalendars() {
        return calendars;
    }
    public void setCalendars(ArrayList<Calendar> calendars) {
        this.calendars = calendars;
    }
}
