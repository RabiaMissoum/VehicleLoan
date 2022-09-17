
<%@include  file="inc/header.jsp" %>

<%   if(session.getAttribute("AUTHOSESSION")==null) { 
   %>
<%@include  file="../inc/navGlob.jsp" %>
<%}else {%>
<%@include  file="../inc/navGlobCal.jsp" %>
<%}%>
<div  id="logg">
 <h2>About Us</h2>
 <div class="rightSA">
 <div id="loginDiv" style="">
     
 </div>
 </div>
</div>
<%@include  file="inc/footer.jsp" %>