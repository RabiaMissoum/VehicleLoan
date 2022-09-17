<%@page import="Model.users"%>
<%@page import="Controller.UserDashServlet"%>

<%@include  file="../inc/header.jsp" %>
<%@include  file="../inc/navGlob.jsp" %>
<style >
.subInp {
 height: 25px;
width: 345px;
}
.TdInp{
height: 25px;
width: 345px;
padding: 2px;
float: left;
margin-left: -200px;
}
</style>

<%
    users us= new users();
    
    UserDashServlet adUs = new UserDashServlet();
    
    if(request.getMethod().equals("POST")){
       us.setRequest(request); 
      us.setResponse(response);
        
    us.setEmail(request.getParameter("email"));
    us.setPassword(request.getParameter("password"));
   
//    user.setRemember(request.getParameter("remember"));
    if(us.getRemember()!=null){
        us.setRemember("on");
    }else{
        us.setRemember("off");
    }
    
    if(adUs.Login(us)){
    }
   
     if(request.getParameter("Id")!=null){
      if(request.getParameter("Id").equals("101")){
         us.setErrorMsg("you are not Authorized you visit this page !");
      }
      else  if(request.getParameter("Id").equals("102")){
         us.setErrorMsg("Susccefuly logged out  !");
      }
      }
    }
    
%>

<div  id="logg">
    <center> <h4 style="color:red;"><b><%= us.getErrorMsg() %></b></h4></center>
 <div class="rightSS" style="height: 350px;margin: 80px 0px">
       <center> <h2>User Login</h2></center>
       <div id="loginDiv" style="margin: 0px 290px" >
     <form action=""  method="POST" >
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td ></td>
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
             
              <td ><a href="forgetpassword.jsp" ><b style="float: right"> ** Forgot Password **</b></a></td>
         </tr>
         <tr>
             <td><input type="submit" value="Login" class="subm" style="height: 40px; margin: 0px 125px;width: 35%">
                <input style="width: 20px;margin: -11px;" type="checkbox" name="remember">
                <b class="rem">Remember Me</b>
                <b><a href="personalDet.jsp" > <b class="Bdes"  style="margin: -40px -90px" >  Register here !!</b> </a></b>
            </td>
         </tr>
         
     </table>
     </form>      
     
 </div>
 </div>
</div>
<%@include  file="inc/footer.jsp" %>

<!-- 
    file="../inc/adminBanner.jsp" -->