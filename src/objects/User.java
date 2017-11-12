package objects;

import java.util.ArrayList;

public class User {

    private String name;
    private int id;
    private int groupID;
    private String email;
    private String password;
    private String image;
    private ArrayList<Task> tasklist;

    void joinGroup (int groupID) {}
    void addTask (Task task) {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGroupID() {
        return groupID;
    }

    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public ArrayList<Task> getTasklist() {
        return tasklist;
    }

    public void setTasklist(ArrayList<Task> tasklist) {
        this.tasklist = tasklist;
    }

    public void assignTask(Task task)
    {
        tasklist.add(task);
    }
}
