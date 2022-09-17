
package Model;

import Essential.EssentialServlet;


public class EMI extends EssentialServlet{
    // loan by Lacs
    private double amountLoan;
     private double amoutT;
    
     // Monthly interest rate %
    private double valmir;
    
     // Monthly interest rate  /12
    private double valInt;
    
    // value of Interest Component of EMI  *
    private double valIntCom;
    
    // value of Principal Component of EMI  --
     private double valPrinComEMI;
     
     
   // value of Principal Outstanding at the end of the month 
    private double valEnd;
    
    private int year;
    
    private String message;

    public EMI() {
        this.message="";
    }
    

    public double getAmountLoan() {
        return amountLoan;
    }

    public void setAmountLoan(double amountLoan) {
        this.amountLoan = amountLoan;
    }

    public double getAmoutT() {
        return amoutT;
    }

    public void setAmoutT(double amoutT) {
        this.amoutT = amoutT;
    }

   

    public double getValmir() {
        return valmir;
    }

    public void setValmir(double valmir) {
        this.valmir = valmir;
    }

    public double getValInt() {
        return valInt;
    }

    public void setValInt(double valInt) {
        this.valInt = valInt;
    }

    public double getValIntCom() {
        return valIntCom;
    }

    public void setValIntCom(double valIntCom) {
        this.valIntCom = valIntCom;
    }

    public double getValPrinComEMI() {
        return valPrinComEMI;
    }

    public void setValPrinComEMI(double valPrinComEMI) {
        this.valPrinComEMI = valPrinComEMI;
    }

   

    public double getValEnd() {
        return valEnd;
    }

    public void setValEnd(double valEnd) {
        this.valEnd = valEnd;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    
}
