package objects;

public class Task {

    String name;
    String description;
    Integer ID;

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
}
