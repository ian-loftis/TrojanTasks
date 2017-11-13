package objects;

import java.util.ArrayList;

public class TaskList {

    private String name;
    private ArrayList<String> items;

    void addItem(String item){}
    void crossOff(String item) {}

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public ArrayList<String> getItems() {
        return items;
    }
    public void setItems(ArrayList<String> items) {
        this.items = items;
    }
}
