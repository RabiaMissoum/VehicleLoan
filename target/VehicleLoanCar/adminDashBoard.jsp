
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
.tdC{
   text-decoration: none 
}
.tdC:hover{
    color: white;
   
}
.dashb{
   width: 240px;
height: 30px; 
border: 1px solid red;
text-align: center;
background: #68aff9;
border-radius: 12px
}
.dashb:hover{
     background-color: #0055ff;
}

</style>
 <h2>Admin Dashboard</h2>
 <center>
 <table> <tr>
             <td class="dashb" ><a  class="tdC" href="#">SETTINGS</a> </td>
             
     </tr></table></center>
 <div id="loginDiv">
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
           <tr>
               <td style="color: red"> </td>
            
         </tr>
         <tr>
             <td class="dashb" ><a  class="tdC" href="#">DASHBOARD</a> </td>
             <td></td>
         </tr>
          <tr>
             <td class="dashb" ><a  class="tdC" href="#">CLIENTS</a> </td>
             <td></td>
         </tr>
          <tr>
             <td class="dashb" ><a  class="tdC" href="#">APPLICATION</a> </td>
             <td></td>
         </tr>
          <tr>
             <td class="dashb" ><a  class="tdC" href="#">REJECTED LIST</a> </td>
             <td></td>
         </tr>
         
         
     </table>
     </form>      
     
 </div>
<%@include  file="inc/footer.jsp" %>

 <%@include  file="../inc/adminBanner.jsp" %> 