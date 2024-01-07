package dqd.sport.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dqd.sport.model.Admin;
import services.AdminService;
public class AdminDao implements AdminService{
	private final Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public AdminDao(Connection con) {
        this.con = con;
    }
    
    public Admin logAdmin(String email, String password){
        Admin admin =  null;
        try{
        query = "select * from admin where email=? and password=?";
        pst=  this.con.prepareStatement(query);
        pst.setString(1, email);
        pst.setString(2, password);
        rs = pst.executeQuery();
        if(rs.next()){
            admin = new Admin();
            admin.setId(rs.getInt("uid"));
            admin.setName(rs.getString("name"));
            admin.setEmail(rs.getString("email"));
        }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return admin;
    }
}
