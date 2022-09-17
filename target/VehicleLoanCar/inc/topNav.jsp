
<%@page import="Model.users"%>
<%@page import="Controller.UserDashServlet"%>
<ul id="topNavU">
   <%  
     users use= new users();
     use.setRequest(request); use.setResponse(response);
       if(session.getAttribute("AUTHOSESSION")==null) { 
   %>
  
    <a href="login.jsp"> <li >Login </li></a>
      <% }else  { %>
    <a href="logout"> <li >Logout <b style="color: #68aff9; text-transform: uppercase; text-decoration: none"> 
                 <%=UserDashServlet.GetLoggedInUser(use) %>  </b></li></a>
     <% } %>
            <a href="#">  <li >Apply Loan</li></a>
                <a href="#">  <li style="border:none">Manage</li></a>
                  
            </ul>