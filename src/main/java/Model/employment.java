
package Model;


public class employment extends Essential.EssentialServlet {
  private String  typeEmp ;
  private String  salary;
  private String  existingEMI;
   private String ErrorMsg;
   

    public String getTypeEmp() {
        return typeEmp;
    }

    public void setTypeEmp(String typeEmp) {
        this.typeEmp = typeEmp;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getExistingEMI() {
        return existingEMI;
    }

    public void setExistingEMI(String existingEMI) {
        this.existingEMI = existingEMI;
    }

    public String getErrorMsg() {
        return ErrorMsg;
    }

    public void setErrorMsg(String ErrorMsg) {
        this.ErrorMsg = ErrorMsg;
    }
  
  
}
