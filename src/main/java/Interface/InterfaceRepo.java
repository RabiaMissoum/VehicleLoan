
package Interface;

import Model.employment;
import Model.identity;
import Model.laon;
import Model.users;
import Model.vehicle;



public interface InterfaceRepo {
    public boolean Login(users user) ;
    public boolean IsValid(users user);
    public boolean Authentic(users user);
    public void IsAuthorise(users user) ;
    public void IsAuthorized(users user);
   //  public static  String GetLoggedInUser(Users user);
     public boolean Register(users user);
     public boolean IsValidRegister(users user) ;
      public boolean sendtoBD(users user);
       public boolean CheckUser(users rus);
       
       
      public boolean IsValidVehicle(vehicle veh);
      public boolean sendVehicletoBD(vehicle veh);
     public boolean CheckVehicle(vehicle veh);
     public void IsAuthorise(vehicle veh) ;
     
     
      public boolean IsValidEmp(employment emp) ;
      public void IsAuthorise(employment emp);
      public boolean sendEmploymenttoBD(employment emp);
          public boolean CheckEmp( employment emp) ;
       
      public void IsAuthorise(laon ln) ;
       public boolean IsValidLoan(laon ln) ;
       public boolean sendLoantoBD(laon ln);
       public boolean CheckLoan(laon ln);
       
       public boolean Identity(identity  ident) ;
       public void IsAuthorise(identity  ident);
       public boolean IsValidIdentity(identity  ident);
       public boolean sendIdentitytoBD(identity  ident);
       public boolean CheckIdentity(identity  ident);
        
}
