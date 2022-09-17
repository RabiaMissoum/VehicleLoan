
package Essential;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EssentialServlet {
    private HttpServletResponse resp;
    private HttpServletRequest request;

    public HttpServletResponse getResponse() {
        return resp;
    }

    public void setResponse(HttpServletResponse response) {
        this.resp = response;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    
    
}
