
<%@page import="Model.identity"%>
<%@include  file="inc/header.jsp" %>

 <%   if(session.getAttribute("AUTHOSESSION")==null) { 
   %>
<%@include  file="../inc/navGlob.jsp" %>
<%}else {%>
<%@include  file="../inc/navGlobCal.jsp" %>
<%}%>

<style type="text/css">
     #apl{
         color: green;
     }
     #span{
       color: red;
       font-size : 17px;  
     }
     .ident{
   float: left;
  width: 523px;
  margin-right: -135px;
  margin-top: -70px;
       }
 .TDId{
   float: right;
  margin: -33px -17px;
       }
 </style>
 
 <%
   identity ident = new identity();
   UserDashServlet ad = new UserDashServlet();
   
  if(request.getMethod().equals("POST")){
      ident.setRequest(request);
   ident.setResponse(response);
   
   ident.setAadhar(request.getParameter("adhar"));
   ident.setPan(request.getParameter("pan"));
   ident.setPhoto(request.getParameter("photo"));
    ident.setSalarySlip(request.getParameter("salarySlip"));
      
      if(ad.Identity(ident)){
          
      }
  }
 %>
 
  <div class="rightSS" style=" height: 450px; font-size: 18px;">

      <div style="text-align: center; font-size: 13px; margin: 10px ">
        <a style="color: blue" href="userDashboard.jsp"> DASHBOARD  </a> <b>|</b> <b>.&nbsp;.&nbsp;.&nbsp;.</b></div>
    <center> <h2>Identity Details</h2></center>
    
    
 <div id="loginDiv" style="margin: 40px  200px;" >
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
          <tr class="ident">
             <td >Aadhar Card :</td>
             <td class="TDId" style=" float: right; margin:-30px -75px"> <span id="span" >
                     <input id="apl" class="block"  type="file" id="adhar" name="adhar" />Choose File to Upload</span></td>
         </tr>
         <tr class="ident" style=" margin: 0px 0px;width: 420px;">
          <td >Pan Card :</td> 
          <td style=" float: right; margin:-30px -175px"> <span id="span"  > 
                  <input type="file" id="apl"  name="pan" >Choose File to Upload</span></td>
         </tr>
         <tr class="ident">
             <td >Photo  :</td>
             <td class="TDId" style=" float: right; margin:-30px -75px"> <span id="span" >
                     <input id="apl" class="block"  type="file" id="adhar" name="photo" />Choose File to Upload</span></td>
         </tr>
         <tr class="ident" style=" margin: 0px 0px;width: 420px;">
          <td >Six Months Salary Slip :</td> 
          <td style=" float: right; margin:-30px -175px"> <span id="span"  > 
                  <input type="file" id="apl"  name="salarySlip" >Choose File to Upload</span></td>
         </tr>
         <tr>
             <td></td>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <td><input  class="subm"  style="margin: 25px 125px;width: 55%;" type="submit" value="Submit"></td>
         </tr>
     </table>
     </form>  
 
 </div>
 </div>
<%@include  file="inc/footer.jsp" %>
