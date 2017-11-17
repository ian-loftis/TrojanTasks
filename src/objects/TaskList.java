package objects;

import java.util.ArrayList;

public class TaskList {

	private String name;
	private ArrayList<String> items;

	public TaskList() {
		items = new ArrayList<String>();
	}

	public void addItem(String item) {
		items.add(item);
	}

	public void crossOff(String item) {
	}

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
