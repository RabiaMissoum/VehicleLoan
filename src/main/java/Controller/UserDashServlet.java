package Controller;

import java.sql.*;

import BDContect.Connect;
import Model.employment;
import Model.identity;
import Model.laon;
import Model.users;
import Model.vehicle;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;


public class UserDashServlet implements Interface.InterfaceRepo{
private static Connection conn;
private  Statement state;	
	public UserDashServlet() {
		conn = Connect.CONNECTION();
               
	}
	
@Override
	public boolean Login(users user) {
		if(this.IsValid(user)) {
			if(this.Authentic(user)) {
                          this.IsAuthorise(user);
                          return true;
                                
			}else {
				user.setErrorMsg("Incorrect Email-Id and Password");
                                return false;
				
			}
		}else {
			user.setErrorMsg("Please Mention Email-Id and Password");
                        return false;
		}
	}
	
@Override
	public boolean IsValid(users user) {
		return (!user.getEmail().equals("")&& (!user.getPassword().equals("")));
	}
	
@Override
	public boolean Authentic(users user) {

                String query="select * from `users` where email='"+user.getEmail()+"' "
                        + "and password='"+user.getPassword()+"'";
                
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
	
@Override
	public void IsAuthorise(users user)  {
    try {
        if(user.getRemember().equals("on")){
                Cookie c = new Cookie("AUTOCOOKIE", user.getEmail());
               // c.setHttpOnly(true);
                c.setSecure(true);
                c.setMaxAge(60*60*24*30);
                user.getResponse().addCookie(c);
                user.getResponse().sendRedirect("userDashboard.jsp");
            }
        else{
             user.getRequest().getSession().setAttribute("AUTHOSESSION", user.getEmail());
            user.getResponse().sendRedirect("userDashboard.jsp");
               
        }
    } catch (Exception ex) {
        System.err.println(ex);
    }
        
	}
        
        public void IsAuthorized(users user){
        
        boolean Validate = false;
        
        HttpSession session = user.getRequest().getSession();
        
        String ReturnValue=  "Anonymous";
        
        // create cookies array, bcz has many Cookies is like cookies Shooping
         Cookie[] cookies = user.getRequest().getCookies();
          
       try {
             if(session.getAttribute("AUTHOSESSION")!= null){
                 if(cookies!=null){
                     for(Cookie c: cookies){
                        if(c.getName().equals("AUTOCOOKIE")){
                            Validate =true;
                                
                        }
                     }
                     
                 }
             }else{
                  Validate = false;
             }
             if( Validate ==false){
                 try{
             //user.getResponse().sendRedirect("Login?Id=101");
//                 
           RequestDispatcher dispacher = user.getRequest().getRequestDispatcher("login.jsp?Id=101");
        //     RequestDispatcher dispacher = user.getRequest().getRequestDispatcher("dashboard.jsp");   
             dispacher.forward(user.getRequest(), user.getResponse());
              }
                 catch (Exception ex) {
                user.setErrorMsg(ex.getMessage());
             }
             }
       } catch (Exception ex) {
                user.setErrorMsg(ex.getMessage());
             }
                 
        
    } 
    
    public static String GetLoggedInUser(users user){
        
     HttpSession session = user.getRequest().getSession();
      Cookie[] cookies = user.getRequest().getCookies();
             
     String ReturnValue=  "Anonymous";
       if(session.getAttribute("AUTHOSESSION")!=null){
          ReturnValue = session.getAttribute("AUTHOSESSION").toString();
      }
      else{
          for (Cookie c : cookies){
                if(c.getValue().equals("AUTOCOOKIE")){
                    ReturnValue = c.getValue().toString();
                }
            }
         }
         
        return  ReturnValue;
       
    }
    


    
@Override
        public boolean Register(users user) {
        if(this.IsValidRegister(user)){
           if(this.CheckUser(user)){
               if(this.sendtoBD(user)){
                   this.IsAuthorise(user);
                   return true;
               }
               return true;
           }else{
               user.setErrorMsg("The user " +user.getEmail()+"Already Exists ");
               return false;
           }
        }else{
            user.setErrorMsg("Please Fill in  All * fields");
            return false;
        }
       
         }

@Override
        public boolean IsValidRegister(users user) {
        if(!user.getFname().equals("")  && !user.getAddress().equals("") && !user.getCity().equals("") && 
               !user.getGender().equals("") &&  !user.getPassword().equals("") &&  !user.getEmail().equals("")){
            return true;
        }else{
            user.setErrorMsg("Please fill in all the * fields");
                 return false;
        }
       }
    

@Override
    public boolean sendtoBD(users user) {
        String value="";
         try { 
             String query="INSERT INTO `users` (`email`, `password`, `fname`, `age`, `gender`, `mobile`,"
               + " `address`, `state`, `city`, `pincode`)  VALUES ('"+user.getEmail()+"',"
               + "'"+user.getPassword()+"','"+user.getFname()+"','"+user.getAge()+"',"
               + "'"+user.getGender()+"','"+user.getMobile()+"','"+user.getAddress()+"',"
               + "'"+user.getState()+"','"+user.getCity()+"',"
               + "'"+user.getPincode()+"')";
             
              PreparedStatement state= conn.prepareStatement(query);
	     state.execute();
              return true;     
            
        } catch (SQLException ex) {
          user.setErrorMsg(" this is wrong"+ex.getMessage());
                 
          return false ;

        } finally{
            try {
                Connect.CONNECTION().close();
            } catch (SQLException ex) {
                
            }
         }
    }

@Override
    public boolean CheckUser(users rus) {
        String query="select * from 'users' where email='"+rus.getEmail()+"'";
        
       try {
         Statement state= conn.createStatement();
	ResultSet rt = state.executeQuery(query);
           if(rt.next()){
               
               return true;
           }else{
               return false;
           }
           
       } catch (SQLException ex) {
         // rus.setErrorMsg("The user  " +rus.getEmail()+"  Already Exists ");
          try{
              rus.getResponse().sendRedirect("login.jsp");
            } catch (IOException ex1) {
                Logger.getLogger(UserDashServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
          return true;
       }
    }
 
// add Vehicle detail
     public boolean Vehicle(vehicle  veh) {
        if(this.IsValidVehicle(veh)){
           if(this.CheckVehicle(veh)){
               if(this.sendVehicletoBD(veh)){
                   this.IsAuthorise(veh);
                   return true;
               }
               return true;
           }else{
               veh.setErrorMsg("The Vehicle " +veh.getMatricule()+"Already Exists ");
               return false;
           }
        }else{
            veh.setErrorMsg("Please Fill in  All * fields");
            return false;
        }
       
         }
   
     @Override
	public void IsAuthorise(vehicle veh)  {
    try {
            veh.getRequest().getSession().setAttribute("AUTHOSESSION", veh.getMatricule());
            veh.getResponse().sendRedirect("userDashboard.jsp");
           }
     catch (Exception ex) {
        System.err.println(ex);
    }
        
	}
     
     @Override
        public boolean IsValidVehicle(vehicle veh) {
        if(!veh.getMark().equals("")  && !veh.getModel().equals("") && !veh.getPrice().equals("") ){
            return true;
        }else{
            veh.setErrorMsg("Please fill in all the * fields");
                 return false;
        }
       }
    

        @Override
    public boolean sendVehicletoBD(vehicle veh) {
        String value="";
         try { 
             String query="INSERT INTO `vehicle`(`matricule`, `mark`, `model`, `price`) VALUES "
           + "('"+veh.getMatricule()+"','"+veh.getMark()+"','"+veh.getModel()+"','"+veh.getPrice()+"')";
             
              PreparedStatement state= conn.prepareStatement(query);
	     state.execute();
              return true;     
            
        } catch (SQLException ex) {
          veh.setErrorMsg(" this is wrong"+ex.getMessage());
                 
          return false ;

        } finally{
            try {
                Connect.CONNECTION().close();
            } catch (SQLException ex) {
                
            }
         }
    }

@Override
  
  public boolean CheckVehicle(vehicle veh) {
        String query="select * from 'vehicle' where email='"+veh.getMatricule()+"'";
        
       try {
         Statement state= conn.createStatement();
	ResultSet rt = state.executeQuery(query);
           if(rt.next()){
               
               return true;
           }else{
               return false;
           }
           
       } catch (SQLException ex) {
         // rus.setErrorMsg("The user  " +rus.getEmail()+"  Already Exists ");
          try{
              veh.getResponse().sendRedirect("dashboard.jsp");
            } catch (IOException ex1) {
                Logger.getLogger(UserDashServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
          return true;
       }
    }
 
    
 // add empoyment
  
   public boolean Employment(employment  emp) {
        if(this.IsValidEmp(emp)){
           if(this.CheckEmp(emp)){
               if(this.sendEmploymenttoBD(emp)){
                   this.IsAuthorise(emp);
                   return true;
               }
               return true;
           }else{
               emp.setErrorMsg("The Type of Employment  " +emp.getTypeEmp()+"Already Exists ");
               return false;
           }
        }else{
            emp.setErrorMsg("Please Fill in  All * fields");
            return false;
        }
       
         }
   
     @Override
	public void IsAuthorise(employment emp)  {
    try {
            emp.getRequest().getSession().setAttribute("AUTHOSESSION", emp.getTypeEmp());
            emp.getResponse().sendRedirect("userDashboard.jsp");
           }
     catch (Exception ex) {
        System.err.println(ex);
    }
      }
     
     @Override
        public boolean IsValidEmp(employment emp) {
        if(!emp.getTypeEmp().equals("")  && !emp.getSalary().equals("") && !emp.getExistingEMI().equals("") ){
            return true;
        }else{
            emp.setErrorMsg("Please fill in all the * fields");
                 return false;
        }
       }
    

        @Override
    public boolean sendEmploymenttoBD(employment emp) {
        String value="";
         try { 
             String query="INSERT INTO `employment`(`typeEmpl`, `annualSalary`, `existingEMI`) VALUES "
           + "('"+emp.getTypeEmp()+"','"+emp.getSalary()+"','"+emp.getExistingEMI()+"')";
             
              PreparedStatement state= conn.prepareStatement(query);
	     state.execute();
              return true;     
            
        } catch (SQLException ex) {
          emp.setErrorMsg(" this is wrong"+ex.getMessage());
                 
          return false ;

        } finally{
            try {
                Connect.CONNECTION().close();
            } catch (SQLException ex) {
                
            }
         }
    }

@Override
  
  public boolean CheckEmp( employment emp) {
        String query="select * from 'employment' where typeEmpl='"+emp.getTypeEmp()+"'";
        
       try {
         Statement state= conn.createStatement();
	ResultSet rt = state.executeQuery(query);
           if(rt.next()){
               
               return true;
           }else{
               return false;
           }
           
       } catch (SQLException ex) {
         // rus.setErrorMsg("The user  " +rus.getEmail()+"  Already Exists ");
          try{
              emp.getResponse().sendRedirect("dashboard.jsp");
            } catch (IOException ex1) {
                Logger.getLogger(UserDashServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
          return true;
       }
    }
 
    
 // add loan det
  
    public boolean Laon(laon  ln) {
        if(this.IsValidLoan(ln)){
           if(this.CheckLoan(ln)){
               if(this.sendLoantoBD(ln)){
                   this.IsAuthorise(ln);
                   return true;
               }
               return true;
           }else{
               ln.setErrorMsg("The Loan  " +ln.getAmount()+"Already Exists ");
               return false;
           }
        }else{
            ln.setErrorMsg("Please Fill in  All * fields");
            return false;
        }
       
         }
   
     @Override
	public void IsAuthorise(laon ln)  {
    try {
            ln.getRequest().getSession().setAttribute("AUTHOSESSION", ln.getAmount());
            ln.getResponse().sendRedirect("userDashboard.jsp");
           }
     catch (Exception ex) {
        System.err.println(ex);
    }
      }
     
     @Override
        public boolean IsValidLoan(laon ln) {
        if(!ln.getAmount().equals("")  && !ln.getAmountT().equals("") && !ln.getRateInterest().equals("") ){
            return true;
        }else{
            ln.setErrorMsg("Please fill in all the * fields");
                 return false;
        }
       }
    

        @Override
    public boolean sendLoantoBD(laon ln) {
        String value="";
         try { 
             String query="INSERT INTO `loan`(`amountL`, `amountT`, `rateinterest`) VALUES "
           + "('"+ln.getAmount()+"','"+ln.getAmountT()+"','"+ln.getRateInterest()+"')";
             
              PreparedStatement state= conn.prepareStatement(query);
	     state.execute();
              return true;     
            
        } catch (SQLException ex) {
          ln.setErrorMsg(" this is wrong"+ex.getMessage());
                 
          return false ;

        } finally{
            try {
                Connect.CONNECTION().close();
            } catch (SQLException ex) {
                
            }
         }
    }

@Override
  
  public boolean CheckLoan(laon ln) {
        String query="select * from 'loan' where amountL='"+ln.getAmount()+"'";
        
       try {
         Statement state= conn.createStatement();
	ResultSet rt = state.executeQuery(query);
           if(rt.next()){
               
               return true;
           }else{
               return false;
           }
           
       } catch (SQLException ex) {
         // rus.setErrorMsg("The user  " +rus.getEmail()+"  Already Exists ");
          try{
              ln.getResponse().sendRedirect("dashboard.jsp");
            } catch (IOException ex1) {
                Logger.getLogger(UserDashServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
          return true;
       }
    }
 
  // add  identity

    public boolean Identity(identity  ident) {
        if(this.IsValidIdentity(ident)){
           if(this.CheckIdentity(ident)){
               if(this.sendIdentitytoBD(ident)){
                   this.IsAuthorise(ident);
                   return true;
               }
               return true;
           }else{
               ident.setErrorMsg("The Aadhar Card Identity  " +ident.getAadhar()+"Already Exists ");
               return false;
           }
        }else{
            ident.setErrorMsg("Please Fill in  All * fields");
            return false;
        }
       
         }
   
   @Override
    public void IsAuthorise(identity  ident)  {
    try {
            ident.getRequest().getSession().setAttribute("AUTHOSESSION", ident.getAadhar());
            ident.getResponse().sendRedirect("userDashboard.jsp");
           }
     catch (Exception ex) {
        System.err.println(ex);
    }
      }
     
   @Override
     public boolean IsValidIdentity(identity  ident) {
      if(!ident.getAadhar().equals("")  && !ident.getPan().equals("") && !ident.getSalarySlip().equals("")
                && !ident.getPhoto().equals("") ){
            return true;
        }else{
            ident.setErrorMsg("Please fill in all the * fields");
                 return false;
        }
       }
    

     @Override
    public boolean sendIdentitytoBD(identity  ident) {
        String value="";
         try { 
             String query="INSERT INTO `identity`(`aadharC`, `pan`, `photo`, `salarySlip`) VALUES "
           + "('"+ident.getAadhar()+"','"+ident.getPan()+"','"+ident.getPhoto()+"','"+ident.getSalarySlip()+"')";
             
              PreparedStatement state= conn.prepareStatement(query);
	     state.execute();
              return true;     
            
        } catch (SQLException ex) {
          ident.setErrorMsg(" this is wrong"+ex.getMessage());
                 
          return false ;

        } finally{
            try {
                Connect.CONNECTION().close();
            } catch (SQLException ex) {
                
            }
         }
    }

@Override
 public boolean CheckIdentity(identity  ident) {
        String query="select * from 'identity' where aadharC='"+ident.getAadhar()+"'";
        
       try {
         Statement state= conn.createStatement();
	ResultSet rt = state.executeQuery(query);
           if(rt.next()){
               
               return true;
           }else{
               return false;
           }
           
       } catch (SQLException ex) {
         // rus.setErrorMsg("The user  " +rus.getEmail()+"  Already Exists ");
          try{
              ident.getResponse().sendRedirect("userDashboard.jsp");
            } catch (IOException ex1) {
                Logger.getLogger(UserDashServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
          return true;
       }
    }
 
}
