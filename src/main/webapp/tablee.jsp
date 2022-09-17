
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
<head>

        
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Calculator </title>
    </head>
    <body>
        <h1>Hello World!</h1>

                <%
                    int a = 30;
                    int b = 20;
                    int c = 0;
                    int d = 0;
                %>
                <br/><br/><br/>
                <table cellspacing="5" cellpadding="5" border="1">
                    <tr>
                        <td>Month</td>
                        <td>A</td>
                        <td>B</td>
                        <td>C</td>
                    </tr>
                    
                    <% for(int i=1; i<5;i++){ %>
                    <%
                        if(i<=1){
                    %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=a%></td>
                            <td><%=b%></td>
                            <td> 
                                <% c = a+b; %>
                                <%=c %>
                            </td>
                        </tr>
                    <% 
                    }else{
                    %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=c%></td>
                            <td><%=b%></td>
                            <td><% d = b+c; %>
                            <%=d%>
                            </td>
                            
                             <%c=d;%>
                        </tr>
                        
                        <%
                            }
                        }
                        %>
                </table>
                
    </body>
</html>
