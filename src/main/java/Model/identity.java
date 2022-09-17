
package Model;


public class identity extends Essential.EssentialServlet {
   private String  aadhar;
   private String  pan;
   private String  photo;
   private String  salarySlip;
   private String ErrorMsg;
   
   
  
    public String getAadhar() {
        return aadhar;
    }

    public void setAadhar(String aadhar) {
        this.aadhar = aadhar;
    }

    public String getPan() {
        return pan;
    }

    public void setPan(String pan) {
        this.pan = pan;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getSalarySlip() {
        return salarySlip;
    }

    public void setSalarySlip(String salarySlip) {
        this.salarySlip = salarySlip;
    }

    public String getErrorMsg() {
        return ErrorMsg;
    }

    public void setErrorMsg(String ErrorMsg) {
        this.ErrorMsg = ErrorMsg;
    }
    
   
}
