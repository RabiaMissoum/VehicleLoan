
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="Sevlet", urlPatterns = "/logout")
public class Logout extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session= request.getSession();
        Cookie[] co= request.getCookies();
        if(session.getAttribute("AUTHOSESSION")!=null){
            session.removeAttribute("AUTHOSESSION");
        }
        for(Cookie c:co){
            if(c.getName().equals("AUTHOCOOKIE")){
                c.setMaxAge(0);
                response.addCookie(c);
            }
        }
        
           RequestDispatcher dispacher = request.getRequestDispatcher("login.jsp?Id=102"); // request.getRequestDispatcher("Login?=102");
//      RequestDispatcher dispacher = request.getRequestDispatcher("Login?Id=102");
 // RequestDispatcher dispacher = request.getRequestDispatcher("login.jsp");
      dispacher.forward(request, response);
//        RequestDispatcher dispa= request.getRequestDispatcher("login.jsp");
//        dispa.forward(request, response);
        
        
    }

   
   
  

}
