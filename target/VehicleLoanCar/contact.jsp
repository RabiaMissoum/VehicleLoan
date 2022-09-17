
<%@include  file="inc/header.jsp" %>

 <%   if(session.getAttribute("AUTHOSESSION")==null) { 
   %>
<%@include  file="../inc/navGlob.jsp" %>
<%}else {%>
<%@include  file="../inc/navGlobCal.jsp" %>
<%}%>
<div  id="cont">
    <center>
<div class="H3cont">	
<h3 > Contact Us</h3> 
</div>
<div class="rightS">
    <div class="contentConL" >
       <div style="margin: 10px;float: left;">
           <div style="width: 450px;">
               <i class="fa fa-map-marker" aria-hidden="true" style="float: left;"></i>
               <h4 class="H4">Visit Us</h4>

               <p class="par" > Srinagar, Kashmir, J &amp; K.</p>
						</div>	
					</div>	 
        
        <div style="margin: 15px 80px;float: left;">
          
               <i class="fa fa-envelope-o" aria-hidden="true" style="float: left;"></i>
               <h4 class="H4">Mail</h4>

               <p class="par" style="font-size: 16px" > <a href="mailto:#">vehicleloancar@gmail.com</a></p>
						</div>	
        
         
        <div style="margin: -20px 80px;float: left;">
          
               <i class="fa fa-envelope-o" aria-hidden="true" style="float: left;"></i>
               <h4 class="H4">Call Us</h4>

               <p class="par" style="font-size: 16px" >
                   
		<p>+91 1010101010 &nbsp;&nbsp;&nbsp; +91 1111111111 &nbsp;&nbsp;&nbsp;+91 0000000000</p>
		<a href="login.jsp" style="text-decoration: none;"> click me </a>
		
						</div>	
					 
    </div>
    <div class="contentCon" >
    <img  src="${pageContext.request.contextPath}/images/contact.jpg" width="500" height="320" />
		     
    </div>
</div>
	
    </center>
</div>
<%@include  file="inc/footer.jsp" %>