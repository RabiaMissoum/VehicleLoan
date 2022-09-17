<%@page import="Model.EMI"%>
<%@page import="Controller.EMIcalcul"%>
<%@include  file="inc/header.jsp" %>
<%@include  file="../inc/navGlobCal.jsp" %>

<style >
.subInp {
 height: 25px;
width: 345px;
}
.emiPage{
    width: 670px;
float: left;
border: 1px solid red;
height: 500px;
margin: 0px 15px;
}
#H4D{
    margin: 10px 165px;
color: rebeccapurple;

}
.H4DD{
    margin-top: -40px;
float: right;
margin-right: 345px;
color: rebeccapurple;
display: block
}
</style>
<% int a =10;
int b=12;
   EMI emi= new EMI();
   EMIcalcul cul = new EMIcalcul();
    if(request.getMethod().equals("POST")){
       emi.setRequest(request); 
      emi.setResponse(response);
      
      emi.setAmountLoan(Double.valueOf(request.getParameter("amount")));
      emi.setAmoutT(Double.valueOf(request.getParameter("amoutT")));
      emi.setValmir(Double.valueOf(request.getParameter("val")));
              
       emi.setValInt(Double.valueOf(request.getParameter("mir")));
       emi.setValIntCom(Double.valueOf(request.getParameter("valIntr"))); 
       emi.setValPrinComEMI(Double.valueOf(request.getParameter("valPrin")));
        emi.setValEnd(Double.valueOf(request.getParameter("valPrin")));
         emi.setYear(Integer.valueOf(request.getParameter("year")));
    if( cul.CaluEMI(emi)){
        
    }
    
    }

%>
 <div class="rightSS" style=" height: 600px; font-size: 18px; width: 98%;float: left;padding: 5px;">
     <center>  <h1 style="font-size: 25px; margin-top: 10px">EMI CALCULATOR</h1></center>
   
 <!--for Record --> 
 <h4 id="H4D"> SELECTION AMOUNT FOR LOAN  </h4>
     <div class="emiPage">  
     <form action=""  method="POST">
     <table  cellspacing="5" cellpadding="5" >
         
          <tr>
         
             <td ><b>Enter Amount Loan :</b></td>
             <td><input class="subInp"   type="text" name="amount" value="<%= emi.getAmountLoan()%>"> &nbsp; &nbsp; &nbsp; <b> Lacs</b></td>
         </tr>
         <tr>
             <td ><b>Enter EMI for Loan</b></td>
             <td><input class="subInp"  type="text" name="amoutT" value="<%= emi.getAmoutT()%>"> &nbsp; &nbsp; &nbsp; <b> &#x20B9;</b></td>
         </tr>
          <tr>
             <td ><b>Enter Monthly Interest</b></td>
             <td><input class="subInp"  type="text" name="val" value="<%= emi.getValmir()%>"> &nbsp; &nbsp; &nbsp; <b> &percnt;</b> 
              
             </td>
         </tr>
         <tr><td></td>
             <td> Monthly Interest Rate <input class="subInp"  type="text" name="mir"
                                               value="<%= emi.getValInt()%>" > &nbsp; &nbsp; &nbsp; <b> &percnt;</b>
             </td></tr>
         
          <tr>
             <td ><b>Interest Component of EMI</b></td>
             <td><input class="subInp"  type="text" name="valIntr" value="<%= emi.getValIntCom()%>" > &nbsp; &nbsp; &nbsp; <b> &#x20B9;</b> 
              
             </td>
         </tr>
          <tr>
             <td ><b>Principal Component of EMI </b></td>
             <td><input class="subInp"  type="text" name="valPrin" 
                        value="<%= emi.getValPrinComEMI()%>"> &nbsp; &nbsp; &nbsp; <b> &#x20B9;</b> 
              
             </td>
         </tr>
          <tr>
             <td ><b>Principal Outstanding at the end of the month </b></td>
             <td><input class="subInp"  type="text" name="valEnd" value="<%= emi.getValEnd()%>" > &nbsp; &nbsp; &nbsp; <b> Lacs</b> 
              
             </td>
         </tr>
          <tr>
             <td ><b>Enter Years of Loan :</b></td>
             <td><input id="col" class="subInp"  type="text" name="year" value="<%= emi.getYear()%>"> &nbsp; &nbsp; <b> Years</b> 
               </td>
         </tr>
          <tr>
        <td ><img src="${pageContext.request.contextPath}/images/emiformula.png" width="150" height="50"  ></td>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <td><input  class="subm"  type="submit" value="Submit" ></td></tr>
        
     </table>
     </form> 
        
     </div>
         <!--for Calcul--> 
         <h4 class="H4DD"> EMI SCHEDULE   <span style="color: red;
float: right;
margin-right: -215px;">  &nbsp; <%= emi.getMessage()%></span> </h4>
     <div  id="emiTab" style="height:  498px; width: 692px">
         <div class="tableWrap" style="width: 680px;height: 486px;">
  <table>
    <thead>
      <tr>
        <th><span>Month</span></th>
        <th>
          <span>Principal Outstanding at the Beginning of the Month</span>
        </th>
        <th><span>EMI</span></th>
        <th><span>Interest</span></th>
        <th><span>Principal Repayment</span></th>
        <th><span>Principal Outstanding at the End of the Month</span></th>
        <th><span>&percnt; Loan Repaid</span></th>
      </tr>
    </thead>
    <tbody>
      
        <%  int month = (int)emi.getYear()*12;
       //  double repay=emi.getAmoutT()-emi.getValEnd()*emi.getValInt();
            double value=emi.getValEnd();
            double result=0;
            double repay=0;
             double Int=0;
            
             
       for(int i=1;i<=month;i++){
        %> 
        <%
           if(i<=1){
           %>
      <tr>
      
        <td><%= i %></td>
        <td><%=emi.getAmountLoan()*100000%></td>
        <td><%=emi.getAmoutT()%></td>
        <td><%=emi.getValIntCom()%></td>
        <td><%=emi.getValPrinComEMI()%></td>
        <td><%=emi.getValEnd()%></td>
        <td><%=emi.getValPrinComEMI()/emi.getAmountLoan()*100000%></td>
        </tr>
        <%}else{%>
         <tr>
        <td><%= i %></td>
        <td><%=value%></td>
        <td><%= emi.getAmoutT()%>  </td>
        <td><% Int=value*emi.getValInt();%> <%= Int%></td>
        <td><% repay=emi.getAmoutT()-Int;%>  <%= repay%></td>
        <td><% result=value-repay;%> <%= result%></td>
        <td><%= (repay/emi.getAmountLoan()*i)/100000 %></td>
          <% value=result; %>
      </tr>
       
      <% } 
        }%>
  
    </tbody>
  </table>
</div>
      </div>
    </center> 

 </div>
<%@include  file="inc/footer.jsp" %>