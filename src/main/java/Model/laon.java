
package Model;

public class laon extends Essential.EssentialServlet {
  private String  amount;
private String  amountT;
private String  rateInterest;
 private String ErrorMsg;

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getAmountT() {
        return amountT;
    }

    public void setAmountT(String amountT) {
        this.amountT = amountT;
    }

    public String getRateInterest() {
        return rateInterest;
    }

    public void setRateInterest(String rateInterest) {
        this.rateInterest = rateInterest;
    }

    public String getErrorMsg() {
        return ErrorMsg;
    }

    public void setErrorMsg(String ErrorMsg) {
        this.ErrorMsg = ErrorMsg;
    }
  
}
