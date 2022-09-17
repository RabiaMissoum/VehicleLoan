
<%@include  file="inc/header.jsp" %>

 <style >
   #BannerDiv{
    display: none;
    } 
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
</style>
<center >
 <h2>Loan Details</h2>
 <div id="loginDiv">
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red"> </td>
            
         </tr>
          <tr>
             <td >Loan Amount:</td>
             <td><input type="text" name="txtamount"></td>
         </tr>
         <tr>
             <td>Loan Tenure:</td>
             <td><input type="text" name="txttenure"></td>
         </tr>
          <tr>
             <td >Rate Of Interest:</td>
             <td><input type="text" name="txtrate"></td>
         </tr>
        
         <tr>
             <td></td>
             <td><input type="submit" value="Submit" class="subm"></td>
         </tr>
     </table>
     </form>      
    </center> 
 </div>
<%@include  file="inc/footer.jsp" %>
