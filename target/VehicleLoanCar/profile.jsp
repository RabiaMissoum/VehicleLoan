
<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.Users"%>
<%@include  file="inc/header.jsp" %>
<% 
    Users user= new Users();
    UserDashServlet adU = new UserDashServlet();
    if(request.getMethod().equals("POST")){
       user.setRequest(request); 
       user.setResponse(response);
       
    user.setEmail(request.getParameter("email"));
    user.setPassword(request.getParameter("password"));
  
    adU.IsAuthorise(user);
    }
 
%>
 <style >
   #BannerDiv{
    display: none;
    } 
</style>
<center >
  
 <h2>User DashBoard</h2>
 <div id="loginDiv">
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red">Welcome <%=user.getFname() %> to Profile Page</td>
            
         </tr>
          <tr>
             <td >Aadhar Card :</td>
             <td>
<form action="/#">
  <input type="file" id="adhar" name="Choose File to Upload ">
  <input type="submit">
</form>
             </td>
         </tr>
         <tr>
             <td >Pan Card :</td>
             <td>
<form action="/#">
  <input type="file" id="pan" name="Choose File to Upload ">
  <input type="submit">
</form></td>
         </tr>
          <tr>
             <td >Photo :</td>
             <td>
<form action="/#">
  <input type="file" id="photo" name="Choose File to Upload ">
  <input type="submit">
</form></td>
         </tr>
        <tr>
             <td >Six Months Salary Slip :</td>
             <td>
<form action="/#">
  <input type="file" id="salary" name="Choose File to Upload ">
  <input type="submit">
</form></td>
         </tr>
         
         <tr>
             <td></td>
             <td><input type="submit" value="Login"></td>
         </tr>
     </table>
     </form>      
    </center> 
 </div>
<%@include  file="inc/footer.jsp" %>