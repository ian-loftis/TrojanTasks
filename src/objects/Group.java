package objects;

import java.util.ArrayList;

public class Group {

    private int groupID;
    private ArrayList<User> users;
    private ArrayList<List> lists;
    private ArrayList<Calendar> calendars;

    void addUser(int id) {}
    void removeUser(int id) {}
    void addList(String name) {}
    void removeList(String name) {}

    public int getGroupID() {
        return groupID;
    }
    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }
    public ArrayList<User> getUsers() {
        return users;
    }
    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }
    public ArrayList<List> getLists() {
        return lists;
    }
    public void setLists(ArrayList<List> lists) {
        this.lists = lists;
    }
    public ArrayList<Calendar> getCalendars() {
        return calendars;
    }
    public void setCalendars(ArrayList<Calendar> calendars) {
        this.calendars = calendars;
    }
}
