package managers;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import objects.Calendar;
import objects.Day;
import objects.Event;
import objects.Group;
import objects.Task;
import objects.TaskList;
import objects.Time;
import objects.User;

public class DBManager {
    private static DBManager dbManager;
    private MongoDatabase database;
    private MongoCollection<Document> userCollection;
    private MongoCollection<Document> groupCollection;

    public static DBManager getInstance(){
        if(dbManager == null){
            dbManager = new DBManager();
        }
        return dbManager;
    }
    private DBManager(){
    	String mongolink = "mongodb://intermsof:faYTqllD0OSmpTc4@cluster0-shard-00-00-ulaib.mongodb.net:27017,cluster0-shard-00-01-ulaib.mongodb.net:27017,cluster0-shard-00-02-ulaib.mongodb.net:27017/test?ssl=true&replicaSet=Cluster0-shard-0&authSource=admin";
        MongoClientURI uri = new MongoClientURI(mongolink);
        MongoClient mongoClient = new MongoClient(uri);
        database = mongoClient.getDatabase("trojanTask");
        userCollection = database.getCollection("user");
        groupCollection = database.getCollection("groups");
    }

    //verifies that a user with the provided email is in the database
    //and that the password matches. If it does, then it returns the 
    //appropriate user object, otherwise, it returns null
    public User verify(String email, String password){
        Document user = findById(email,userCollection);
        if(user == null) {
        	System.out.println("coudlnt find");
        }
        if(user != null){
        	User userObj = parseUser(user);
            String correctPW = user.getString("password").toString();

            if(password.equals(correctPW)){
                return userObj;
            }
        }
        return null;
    }

    @SuppressWarnings("unchecked")
	public Group getGroup(String id){
        Document group = findById(id,groupCollection);
        
        //logic for turning document into object
        if(group != null){
            Group result = new Group();
            //string fields
            result.setGroupID(id);
            result.setName(group.getString("name"));
            //get users from array of user ids
            ArrayList<String> ids = (ArrayList<String>)group.get("users");
            for(String s : ids) {
            	result.getUsers().add(parseUser(findById(s,userCollection)));
            }
            //get list objects based on array of lists
            ArrayList<Document> lists = (ArrayList<Document>)group.get("lists");
            for(Document d : lists) {
            	result.getLists().add(parseList(d));
            }
            
            ArrayList<Document> calendars = (ArrayList<Document>)group.get("calendars");
            for(Document d : calendars) {
            	result.getCalendars().add(parseCalendar(d));
            }
            return result;
        }

        return null;
    }

    private Calendar parseCalendar(Document d) {
		Calendar result = new Calendar();
		result.setWeek(d.getString("week"));
		result.setMonth(d.getString("month"));
		result.setGroupId(d.getString("groupid"));
		ArrayList<Document> docs = (ArrayList<Document>)d.get("days");
		for(Document doc : docs) {
			result.getDays().add(parseDay(doc));
		}
		
		return result;
	}

    private Day parseDay(Document d) {
    	Day day = new Day();
    	day.setDay(d.getString("day"));
    	@SuppressWarnings("unchecked")
		ArrayList<Document> docs = (ArrayList<Document>)d.get("events");
    	for(Document doc : docs) {
    		day.getEvents().add(parseEvent(doc));
    	}
    	return day;
    }
    
    @SuppressWarnings("unchecked")
	private Event parseEvent(Document d) {
    	Event e = new Event();
    	e.setCreator(d.getString("creator"));
    	e.setName(d.getString("name"));
    	e.setType(d.getString("type"));
    	e.setDescription(d.getString("description"));
    	e.setTime(parseTime((Document)d.get("time")));
    	e.setUserInvolved((ArrayList<String>)d.get("usersinvolved"));
    	e.setId(d.get("_id").toString());
    	return e;
    }
    
    private Time parseTime(Document d) {
    	Time t = new Time();
    	t.setStartTime(d.getString("startTime"));
    	t.setEndTime(d.getString("endTime"));
    	return t;
    }
    
    @SuppressWarnings("unchecked")
	private TaskList parseList(Document d){
        if(d != null){
            TaskList result = new TaskList();
            result.setName(d.getString("name"));
            result.setType(d.getString("type"));
            result.setItems((ArrayList<String>)d.get("items"));
            //result.set
            return result;
        }
        return null;
    }

    //reuseable helper function for finding documents by ID
    private Document findById(String id, MongoCollection<Document> collection) {
        return collection.find(Filters.eq("_id",id)).first();
    }
    
    //given a document of a user, it returns a user object
    private User parseUser(Document d) {
    	User result = new User();
        result.setEmail(d.getString("_id"));
        result.setName(d.getString("name"));
        result.setGroupID(d.getString("groupid"));

        @SuppressWarnings("unchecked")
		List<Document> tasks = (List<Document>)d.get("tasks");
        for(Document task : tasks){
        	result.getTasklist().add(new Task(task.getString("name"),task.getString("description")
                    ,task.get("_id").toString()));
        }
    	return result;
    }


}
