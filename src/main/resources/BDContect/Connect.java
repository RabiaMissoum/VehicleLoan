package BDContect;

import java.sql.*;

public class Connect {

	public static Connection CONNECTION(){
	    try{
             Class.forName("com.mysql.cj.jdbc.Driver");
	     Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/vehiculeloan","root","");
	     
	      return con;
	    }catch (SQLException  e) {
	    	System.out.println(e.getMessage());
	        return null;
		}
	    catch(ClassNotFoundException e ){
	        System.out.println(e.getMessage());
	        return null;
	    }
	    
	   }
	public static void Close(Connection con) {
    	try {
    		con.close();
    	}catch (Exception e) {

	        System.out.println(e.getMessage());
		}
    }   

}
