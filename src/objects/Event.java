package objects;

import java.util.ArrayList;

public class Event {
    private String name;
    private int id;
    private String type;
    private ArrayList<Integer> userInvolved;
    private String description;
    private Time time;
    private int creator;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public ArrayList<Integer> getUserInvolved() {
        return userInvolved;
    }

    public void setUserInvolved(ArrayList<Integer> userInvolved) {
        this.userInvolved = userInvolved;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public int getCreator() {
        return creator;
    }

    public void setCreator(int creator) {
        this.creator = creator;
    }
}
