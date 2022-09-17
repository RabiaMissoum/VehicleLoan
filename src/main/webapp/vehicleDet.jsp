
<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.vehicle"%>
<%@include  file="inc/header.jsp" %>


 <%   if(session.getAttribute("AUTHOSESSION")==null) { 
   %>
<%@include  file="../inc/navGlob.jsp" %>
<%}else {%>
<%@include  file="../inc/navGlobCal.jsp" %>
<%}%>

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
<% vehicle veh = new vehicle();
  UserDashServlet ad= new UserDashServlet();
  if(request.getMethod().equals("POST")){
      veh.setRequest(request);
      veh.setResponse(response);
      
      veh.setMatricule(request.getParameter(""));
      veh.setMark(request.getParameter("txtmarkC"));
       veh.setModel(request.getParameter("txtmodelC"));
        veh.setPrice(request.getParameter("txtrprice"));
     if(ad.Vehicle(veh)){
         
     } 
  }       
%>

<div class="rightSS" style=" height: 450px; font-size: 18px;">
    <div style="text-align: center; font-size: 13px; margin: 10px ">
        <a style="color: blue" href="userDashboard.jsp"> DASHBOARD  </a> <b>|</b> <b>.&nbsp;.&nbsp;.&nbsp;.
        </b></div>
     <center> <h2>Vehicle Details</h2></center>

     <div id="loginDiv" style="margin: 5px 200px;">
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red"> </td>
            
         </tr>
          <tr>
             <td >Car Mark:</td>
             <td><select class="TdEmp"   name="txtmarkC">
                     <option >*** SELECT CAR MARK***</option>
                      <option > Fait</option>
                 </select></td>
         </tr>
         <tr>
             <td>Car Model:</td>
             <td><select class="TdEmp"  name="txtmodelC">
                     <option >*** SELECT CAR MODEL***</option>
                     <option > Fait</option>
                 </select></td>
         </tr>
          
        <tr>
             <td>Ex-Showroom Price:</td>
             <td><input class="TdEmp"  type="text" name="txtrprice"></td>
         </tr>
         
         <tr>
          
             <td><input type="submit" value="Submit" class="subm" style="margin-right: -220px;width: 97%">
                </td>
         </tr>
     </table>
     </form>  
     </div>
 </div>
<%@include  file="inc/footer.jsp" %>