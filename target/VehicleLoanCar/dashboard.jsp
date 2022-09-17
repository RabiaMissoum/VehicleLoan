
<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.users"%>
<%@include  file="../inc/header.jsp" %>
<%@include  file="../inc/navGlobCal.jsp" %>

<% 
    users us= new users();
   UserDashServlet ad= new UserDashServlet();
    us.setRequest(request); us.setResponse(response);
 //ad.IsAuthorized(us);
%>
<center >
    
    <h1>Welcome <%=UserDashServlet.GetLoggedInUser(us) %> To  User DashBoard</h1>
    <div id="das" style="background: url('${pageContext.request.contextPath}/images/LoanCar.jpg'); ">
   
      
        <div id="loginDiv" style="margin: 100px 330px" >
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red">  </td>
      
         </tr>
         
         <div >
               <ul id="Bar" >
                    <a href="userDashboard.jsp" >  <li>DASHBOARD</li></a>
                    <a href="LoanDet.jsp"> <li>LOAN AMOUNT</li></a>
                    <a href="EMIcal.jsp">  <li>EMI SCHEDULER</li></a>
                    
                </ul>
            </div>
     </table>
     </form>      
    </center> 
 </div>
<%@include  file="inc/footer.jsp" %>