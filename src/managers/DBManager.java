package managers;

import java.util.ArrayList;
import java.util.List;

import org.bson.BsonArray;
import org.bson.BsonString;
import org.bson.Document;
import org.bson.types.ObjectId;

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
    
    public String addListToGroup(String groupId, TaskList list) {
    	BsonArray items = new BsonArray();
    	for(String s : list.getItems()) {
    		items.add(new BsonString(s));
    	}
    	Document listDoc = new Document("name",list.getName())
    			.append("items", items);
    	groupCollection.updateOne(
    			new Document("_id",new ObjectId(groupId))
    			, new Document("$push",new Document("lists",listDoc)));
    	
    	Document result = findByOId(groupId,groupCollection);
    	@SuppressWarnings("unchecked")
		ArrayList<Document> lists = (ArrayList<Document>)result.get("lists");
    	return lists.get(lists.size() - 1).get("_id").toString();
    }
    
    public void removeListFromGroup(String groupId, String listId) {    	
    	groupCollection.updateOne(
    			Filters.eq("_id", new ObjectId(groupId)), 
    			new Document("$pull",new Document("lists",Filters.eq("_id",new ObjectId(listId)))));
    }

    @SuppressWarnings("unchecked")
	public Group getGroup(String id){
        Document group = findByOId(id,groupCollection);
        
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
            System.out.println(lists.size());
            for(Document d : lists) {
            	result.getLists().add(parseList(d));
            	System.out.println("found list");
            }

            return result;
        }

        return null;
    }

    
    
    @SuppressWarnings("unchecked")
	private TaskList parseList(Document d){
        if(d != null){
            TaskList result = new TaskList();
            result.setName(d.getString("name"));
            result.setItems((ArrayList<String>)d.get("items"));
            result.setID(d.get("_id").toString());
            //result.set
            return result;
        }
        return null;
    }

    //reuseable helper function for finding documents by string ID
    private Document findById(String id, MongoCollection<Document> collection) {
        return collection.find(Filters.eq("_id",id)).first();
    }
    
    //reuseable helper function for finding documents by Object ID
    private Document findByOId(String id, MongoCollection<Document> collection) {
        return collection.find(Filters.eq("_id",new ObjectId(id))).first();
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
        	System.out.println(task.getString("name"));
        	System.out.println(task.getString("description"));
        	System.out.println(task.get("_id").toString());
        	result.getTasklist().add(new Task(task.getString("name"),task.getString("description")
                    ,task.get("_id").toString()));
        }
    	return result;
    }


}
