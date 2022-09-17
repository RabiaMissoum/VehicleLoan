
package Controller;

import Model.EMI;
import com.sun.xml.internal.ws.api.message.Packet;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EMIcalcul {
 private static final DecimalFormat df = new DecimalFormat("0.00");
 
    double am=0, amT=0,intRate=0, mit=0,IntComEMI=0, ValPrinCEMI=0,ValPrinEndEMI=0;
    double res=0, rep=0, intr=0,enn=0;
    public EMIcalcul() {
    }
   
    public boolean CaluEMI(EMI emi){
        
        int year= emi.getYear();
         int month= 12*year;
     

       double[] amount={emi.getValEnd()};
       double[] amountT={emi.getAmoutT()};
       double[] Int={emi.getValEnd()*emi.getValInt()}; //===
       double repay=emi.getAmoutT()-emi.getValEnd()*emi.getValInt();//==
       double[] repa={repay};
       double end[]={emi.getValEnd()-repay};//==
       if(emi.getYear()!=0){

     if(this.Valid(emi)){
        if(this.CalMonthIntR(emi)!=0){
             
            this.IntComEMI(emi);
             this.PrinComEMI(emi);
              this.PrinOutEMI(emi);
             
            this.Authorise(emi);
            return true;
        }else{
            emi.setMessage("Please Calcul value of Monthly Interest Rate !!  ");
        } 
         }else{
            emi.setMessage("Please Enter Amount Loan , Amount Turned Or Interest Rate");
            return false;
        }
      // }
       
       }else{
            emi.setMessage("Please Mention year of Loan");
            return false;
        }
     return true;
    }
      public boolean  Valid(EMI emi) {
        return ((emi.getAmountLoan()!=0) && (emi.getAmoutT()!=0));
       
    }

     public boolean  Authorise(EMI emi) {
         emi.setMessage("EMI Calculor Succssfuly done !!");
         return  true;
    }

    
    public double CalMonthIntR(EMI emi){
       
        intRate=  Double.valueOf(emi.getValmir())/100; 
        mit= intRate/12;
        
      //  mit= Double.valueOf(df.format(mit));
         emi.setValInt(mit);
           
        return emi.getValInt();
    }
    
     // value of Interest Component of EMI 
    
     public double IntComEMI(EMI emi){
       
        am= Double.valueOf(emi.getAmountLoan());
         mit= Double.valueOf(emi.getValInt());
         IntComEMI= mit*am*100000;
        //  IntComEMI= Double.valueOf(df.format(IntComEMI));
          
     emi.setValIntCom(IntComEMI);     
     
        return emi.getValIntCom();
    }
    // Principal Component of EMI 
      public double PrinComEMI(EMI emi){
        amT=   Double.valueOf(emi.getAmoutT());
          
        ValPrinCEMI= amT-emi.getValIntCom();
     //    ValPrinCEMI= Double.valueOf(df.format(ValPrinCEMI));
        emi.setValPrinComEMI(ValPrinCEMI);
        
         return emi.getValPrinComEMI();
     }
     
      // value of Principal Outstanding at the end of the month 
    public double PrinOutEMI(EMI emi){
         am= Double.valueOf(emi.getAmountLoan()); 
        ValPrinEndEMI= (am*100000)-emi.getValPrinComEMI();
        
     //    ValPrinEndEMI= Double.valueOf(df.format(ValPrinEndEMI));
        emi.setValEnd(ValPrinEndEMI);
         return emi.getValEnd();
     }
}
