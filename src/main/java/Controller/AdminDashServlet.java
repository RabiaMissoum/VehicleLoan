package Controller;

import java.sql.*;

import BDContect.Connect;
import Model.users;


public class AdminDashServlet {
private Connection conn;
	
	public AdminDashServlet() {
		conn = Connect.CONNECTION();
	}
	
	public void Login(users user) {
		if(this.IsValid(user)) {
			if(this.Authentic(user)) {
				
			}else {
				user.setErrorMsg("Incorrect Email-Id and Password");
				
			}
		}else {
			user.setErrorMsg("Please Mention Email-Id and Password");
		}
	}
	
	public boolean IsValid(users user) {
		return (!user.getEmail().equals("")&& (!user.getPassword().equals("")));
	}
	
	public boolean Authentic(users user) {
		String query="select * from 'users' where 'email'='"+user.getEmail()+"' and password='"+user.getPassword()+"' ";
		try {
			Statement state= conn.createStatement();
			ResultSet rt = state.executeQuery(query);
			if(rt.next()) {
				return true;
			}return false;
					
			
		}catch (Exception  qr) {
			user.setErrorMsg(qr.getMessage());
		}
		
		return true;
	}
	
	public void IsAuthorise(users user) {
		 user.setErrorMsg("Succssfuly Login In !!");
	}

}
