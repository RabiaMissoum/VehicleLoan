
<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.users"%>
<%@include  file="../inc/header.jsp" %>
<%@include  file="../inc/navGlob.jsp" %>
<style >
.subInp {
 height: 25px;
width: 345px;
}

</style>
<%
       users   user= new users();
       UserDashServlet adU = new UserDashServlet();   
    if(request.getMethod().equals("POST")){
       user.setRequest(request); 
      user.setResponse(response);
  
    
    user.setEmail(request.getParameter("email"));
    user.setPassword(request.getParameter("password"));
    user.setFname(request.getParameter("txtfname"));
    user.setAge(request.getParameter("txtage"));
    user.setGender(request.getParameter("txtgender"));
    user.setMobile(request.getParameter("txtmobile"));

    user.setAddress(request.getParameter("txtaddress"));
    user.setState( request.getParameter("txtstate"));
     user.setCity( request.getParameter("txtcity"));
      user.setPincode(request.getParameter("txtpin"));
    
     if(adU.Register(user)){}
   
    }
%>


<div  id="logg" style=" height: 700px;">
 
 <div class="rightSS" style=" height: 610px;font-size: 18px;">
     <center> <h2>User Register</h2></center>
 <div id="loginDiv" style="margin: 40px 290px" >
     <form action=""  method="POST" style="margin-top: -60px">
     <table  cellspacing="5" cellpadding="5" >
         
         <tr >
               <td style="color: red"><%=  user.getErrorMsg()%> </td>
             </tr>
          
         <tr>
             <td >Enter Email-Id:</td>
             <td><input class="subInp" type="text" name="email" style=""></td>
         </tr>
         <tr>
             <td>Enter Password:</td>
             <td><input class="subInp" type="password" name="password"></td>
         </tr>
         <tr>
             <td >Enter First Name:</td>
             <td><input class="subInp" type="text" name="txtfname"></td>
         </tr>
         <tr>
             <td>Enter Age:</td>
             <td><input class="subInp" type="text" name="txtage"></td>
         </tr>
          <tr>
             <td >Enter Gender:</td>
             <td><input type="radio" name="txtgender">Female
                 <input type="radio" name="txtgender">Male
             </td>
         </tr>
        <tr>
             <td>Enter Mobile Number:</td>
             <td><input class="subInp" type="text" name="txtmobile"></td>
         </tr>
         <tr>
             <td>Enter Address:</td>
             <td><input class="subInp" type="text" name="txtaddress"></td>
         </tr>
         <tr>
             <td>Enter State:</td>
             <td><input class="subInp" type="text" name="txtstate"></td>
         </tr>
         <tr>
             <td>Enter City:</td>
             <td><input class="subInp" type="text" name="txtcity"></td>
         </tr>
         <tr>
             <td>Enter Pin Code:</td>
             <td> <input class="subInp" type="text" name="txtpin"></td>
         </tr>
         <tr>
             <td><input type="submit" value="Submit" class="subm" style="margin: 25px 125px;width: 55%;">
               
                   <b><a href="login.jsp" > <b class="Bdes" style="margin: -67px -88px"  >  Back here !!</b> </a></b></td>
         </tr>
         
     </table>
     </form>      
     
 </div>
 </div>
<%@include  file="inc/footer.jsp" %>
