
<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.Users"%>
<%@include  file="../inc/header.jsp" %>
<%@include  file="../inc/navGlob.jsp" %>
<%
 Users user= new Users();
    UserDashServlet adU = new UserDashServlet();
    
    if(request.getMethod().equals("POST")){
       user.setRequest(request); 
      user.setResponse(response);
        
    user.setEmail(request.getParameter("email"));
    user.setPassword(request.getParameter("password"));
//    user.setRemember(request.getParameter("remember"));
    if(user.getRemember()!=null){
        user.setRemember("on");
    }else{
        user.setRemember("off");
    }
    if(adU.Login(user)){
    }
   
    }
%>

<div  id="logg">

 <div class="rightSS" style="height: 350px">
       <center> <h2>Admin Login</h2></center>
 <div id="loginDiv" >
     <form action=""  method="POST" >
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color:red"><b><%= user.getErrorMsg() %></b></td>
         </tr>
         <tr>
             <td class="TDT" ><b>Enter Email-Id:</b></td>
             <td><input class="TdInp" type="text" name="email"></td>
         </tr>
         <tr>
             <td class="TDT"><b>Enter Password:</b></td>
             <td><input class="TdInp" type="password" name="password"></td>
         </tr>
          <tr>
             
              <td ><a href="#" ><b style="float: right"> ** Forgot Password **</b></a></td>
         </tr>
         <tr>
            <td><input type="submit" value="Login" class="subm">
                <input style="width: 20px;margin: -11px;" type="checkbox" name="remember">
                <b class="rem">Remember Me</b>
            </td>
         </tr>
         
     </table>
     </form>      
     
 </div>
 </div>
</div>
<%@include  file="inc/footer.jsp" %>

