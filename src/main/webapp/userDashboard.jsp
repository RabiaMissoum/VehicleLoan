
<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.users"%>
<%@include  file="../inc/header.jsp" %>
<%@include  file="../inc/navGlobCal.jsp" %>

<style>
    #App{
    float: right;
padding: 13px;
display: inline-block;
text-transform: uppercase;
letter-spacing: 1px;
border-right: #a7d1ff 1px solid;
border-radius: 20px;
background: #000;
margin: 4px;
}
</style>
<% 
    users us= new users();
   UserDashServlet ad= new UserDashServlet();
    us.setRequest(request); us.setResponse(response);
 //ad.IsAuthorized(us);
%>
<center >
    
    <h1>Welcome <%=UserDashServlet.GetLoggedInUser(us) %> To  User DashBoard</h1>
    
    <div id="das" style="background: url('${pageContext.request.contextPath}/images/LoanCar.jpg');margin-top: -81px;">
        <br>
        <div style="text-align: center; font-size: 13px; margin: -11px ">
      <ul><li>  <a style="color: blue; opacity: 1" href="dashboard.jsp">
                  DASHBOARD  </a><b>|</b> <b>.&nbsp;.&nbsp;.&nbsp;. </b> </li></ul></div> 
        <div id="App"><ul><li><a style="color: beige;" href="getEligibility.jsp"> Apply Loan</a></li></ul></div>
        
        <div id="loginDiv" style="height: 60px;margin: 105px 200px">
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red">  </td>
      
         </tr>
         
         <div >
               <ul id="Bar" >
                    <a href="vehicleDet.jsp" > <li>Vehicle details</li></a>
                    <a href="personalDet.jsp"> <li>Applicant Details</li></a>
                    <a href="employementDet.jsp"> <li>Employment Details</li></a>
                    <a href="identityDet.jsp"> <li>Identity Details</li></a> 
                   
                </ul>
            </div>
     </table>
     </form>      
    </center> 
 </div>
<%@include  file="inc/footer.jsp" %>