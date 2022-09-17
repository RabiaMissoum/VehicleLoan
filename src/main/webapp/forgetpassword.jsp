
<%@page import="Model.users"%>
<%@page import="Controller.UserDashServlet"%>
<%@include  file="inc/header.jsp" %>
<% 
users user= new users();
UserDashServlet adU = new UserDashServlet();


    if(request.getMethod().equals("POST")){
       user.setRequest(request); 
       user.setResponse(response);
       
    user.setEmail(request.getParameter("txtemail"));
    user.setPassword(request.getParameter("txtpassword"));
//    user.setRemember(request.getParameter("remember"));
    
    adU.Login(user);
   
    }
  
%>
 <style >
    
         .subm{
    width: 35%;
height: 30px;
background: #202020;
color: white;
font-family: times inherit;
font-size: 16px;
border: 1px solid #ff9cff;
border-radius: 12px;
float: right;
margin: 5px 125px;
}
</style>
 <h2>User Login</h2>
 <div id="loginDiv">
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red"> </td>
            
         </tr>
         <tr>
             <td >Enter Email-Id:</td>
             <td><input type="text" name="txtemail"></td>
         </tr>
         <tr>
             <td>Enter Password:</td>
             <td><input type="password" name="txtPassword"></td>
         </tr>
         <tr>
             <td>Enter Confirm Password:</td>
             <td><input type="password" name="txtCPassword"></td>
         </tr>
          <tr>
              <td></td>
               <td><a href="#" >Forgot Password</a></td>
         </tr>
         <tr>
             <td></td>
             
             <td><input type="submit" value="Login" class="subm"></td>
         </tr>
         
     </table>
     </form>      
     
 </div>
<%@include  file="inc/footer.jsp" %>
