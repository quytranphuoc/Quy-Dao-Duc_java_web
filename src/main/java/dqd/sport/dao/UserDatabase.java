package dqd.sport.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dqd.sport.model.User;

public class UserDatabase {

	private Connection con;

	public UserDatabase(Connection con) {
		this.con = con;
	}

	//for register user 
	public boolean saveUsers(User user){
        boolean set = false;
        try{
            //Insert register data to database
            String query = "insert into users(name,email,password) values(?,?,?)";
           
           PreparedStatement pt = this.con.prepareStatement(query);
           pt.setString(1, user.getName());
           pt.setString(2, user.getEmail());
           pt.setString(3, user.getPassword());
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
}