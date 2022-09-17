 <!--for feching Detail from database and display in this form for check Eligibility--> 
<%@page import="Controller.UserDashServlet"%>
<%@page import="Model.users"%>
<%@include  file="../inc/header.jsp" %>
 <%   if(session.getAttribute("AUTHOSESSION")==null) { 
   %>
<%@include  file="../inc/navGlob.jsp" %>
<%}else {%>
<%@include  file="../inc/navGlobCal.jsp" %>
<%}%>
<style >
.subInp {
 height: 25px;
width: 345px;
}
.tabEgi{
    width: 95%;
    border: 3px solid  #063282;
    padding: 3px; 
    margin-left: 13px
}
.submEgi{
  height: 40px; margin:-55px 55px;width: 85%;background: #202020;
color: white;
font-family: times inherit;
font-size: 16px;
border: 1px solid #ff9cff;
border-radius: 12px;
float: right;  
}
.submEgi:focus{
    background:#007f99;
}
.TdEgi{
    width: 100%;
background: #788cc9;
opacity: 0.5;
border-radius: 15px;
height: 25px;
font-style: oblique;
text-align: center;
}
.capEgi{
    padding: 9px;color: #007f99;
border: 1px solid red;
border-radius: 8px;
}
</style>


<div  id="logg" style=" height: 550px;">
    <center> <h2 style="color: red">CHECK ELIGIBILITY </h2></center>
 <div style="float: right"> <input type="submit" value="APPLY LOAN" class="submEgi" ></div>
 <div class="rightSS" style=" width: 99%;height: 450px;font-size: 18px;margin: 10px 0px">
     <br>  
     
     <form action="" method="POST">
         
 <div id="loginDiv" style=" border: 1px solid  #063282; width: 33%; float: left; height: 350px;margin: 0px;" >
     <table border="1" cellspacing="2" cellpadding="2" class="tabEgi">
         <caption class="capEgi" >VEHICLE DETAIL</caption>
        
             <tr>
             
                 <td class="TdEgi"> <label> CAR MARK</label></td>
             </tr>
             <tr>
                <td class="TdEgi"> <label> CAR MODEL</label> </td>
             </tr>
             <tr>
                <td class="TdEgi"> <label>EX-SHOWROOM PRICE</label></td>
             </tr>
             <tr>
                 <td class="TdEgi"> <label>ON ROAD PRICE</label></td>
             </tr>
        
     </table>

 </div>
     <div id="loginDiv" style=" border: 1px solid #007f99; width: 33%; float: left; height: 350px;margin: 0px;" >
     <table border="1" cellspacing="2" cellpadding="2" class="tabEgi">
         <caption class="capEgi" >APPLICANT DETAIL</caption>
        
             <tr>
             
                 <td class="TdEgi"> <label> NAME</label></td>
             </tr>
             <tr>
                <td class="TdEgi"> <label> AGE</label> </td>
             </tr>
             <tr>
                <td class="TdEgi"> <label>GENDER</label></td>
             </tr>
             <tr>
                 <td class="TdEgi"> <label>TYPE OF EMPLOYMENT</label></td>
             </tr>
             <tr>
                 <td class="TdEgi"> <label>YEARLY SALARY</label></td>
             </tr> 
             <tr>
                 <td class="TdEgi"> <label>EXISTING EMI</label></td>
             </tr>
        
     </table>
 </div>
        <div id="loginDiv" style=" border: 1px solid  #009933; width: 33%; float: left; height: 350px;margin: 0px;" >
     <table border="1" cellspacing="2" cellpadding="2" class="tabEgi">
         <caption class="capEgi" >CONTACT DETAIL</caption>
        
             <tr>
             
                 <td class="TdEgi"> <label> MOBILE NO</label></td>
             </tr>
             <tr>
                <td class="TdEgi"> <label> EMAIL-ID</label> </td>
             </tr>
            
        
     </table>
 </div>
     <center><input type="submit" value="Check Eligibility" class="subm" style="height: 40px; margin: 10px 570px;width: 23%"></center>
     </form>
 </div>
<%@include  file="inc/footer.jsp" %>
