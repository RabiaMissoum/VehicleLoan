
<%@page import="Model.employment"%>
<%@include  file="inc/header.jsp" %>
<%@include  file="../inc/navGlobCal.jsp" %>
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
.TdEmp{
    width: 370px;
height: 30px;
border-radius: 10px;
padding: 3px;
}
</style>
<% 
  employment emp = new employment();
  UserDashServlet ad= new UserDashServlet();
  if(request.getMethod().equals("POST")){
      emp.setRequest(request); 
      emp.setResponse(response);
      
      emp.setTypeEmp(request.getParameter("txtduty"));
      emp.setSalary(request.getParameter("txtsalary"));
      emp.setExistingEMI(request.getParameter("txtEMI"));
      
      if(ad.Employment(emp)){
          
      }
  }
%>
 <div class="rightSS" style=" height: 450px; font-size: 18px;">
     <div style="text-align: center; font-size: 13px; margin: 10px ">
        <a style="color: blue" href="userDashboard.jsp"> DASHBOARD  </a> <b>|</b> <b>.&nbsp;.&nbsp;.&nbsp;.</b></div>
    
     <center> <h2>Employment Details</h2></center>
     <div id="loginDiv" style="margin: 5px 200px;" >
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red"> </td>
            
         </tr>
          <tr>
             <td >Enter Type Of Employment:</td>
             <td><input class="TdEmp" type="text" name="txtduty" ></td>
         </tr>
        
          <tr>
             <td >Enter Annual Salary:</td>
             <td><input class="TdEmp" type="text" name="txtsalary"></td>
         </tr>
        <tr>
             <td>Enter Existing EMI:</td>
             <td><input class="TdEmp" type="text" name="txtEMI"></td>
         </tr>
         
         <tr>
             <td><input type="submit" value="Submit" class="subm" style="margin: 5px -200px;width: 80%; height: 40px" ></td>
         </tr>
         
     </table>
     </form>      
     
 </div>
 </div>
<%@include  file="inc/footer.jsp" %>