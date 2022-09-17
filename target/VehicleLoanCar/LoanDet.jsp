
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

  <div class="rightSS" style=" height: 450px; font-size: 18px;">
     <div style="text-align: center; font-size: 13px; margin: 10px ">
        <a style="color: blue" href="userDashboard.jsp"> DASHBOARD  </a> <b>|</b> <b>.&nbsp;.&nbsp;.&nbsp;.</b></div>
    <center> <h2>Loan Details</h2></center>
 <div id="loginDiv" style="margin: 5px 200px;">
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red"> </td>
            
         </tr>
          <tr>
             <td >Loan Amount:</td>
             <td><input class="TdEmp"  type="text" name="txtamount"></td>
         </tr>
         <tr>
             <td>Loan Tenure:</td>
             <td><input class="TdEmp"  type="text" name="txttenure"></td>
         </tr>
          <tr>
             <td >Rate Of Interest:</td>
             <td><input class="TdEmp"  type="text" name="txtrate"></td>
         </tr>
        
         <tr>
             <td></td>
             <td><input type="submit" value="Submit" class="subm" style="margin: 5px 200px;width: 45%; height: 40px"></td>
         </tr>
     </table>
     </form>      
 </div>
 </div>
<%@include  file="inc/footer.jsp" %>
