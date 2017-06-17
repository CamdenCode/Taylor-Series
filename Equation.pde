public class Equation {

  String eq;
  ArrayList<Float> nums;
  ArrayList<Equation> para;
  
  Taylor_Series ts;

  public Equation(String eq, ArrayList<Float> nums, ArrayList<Equation> para, Taylor_Series ts) {
    this.eq = eq;
    this.nums = nums;
    this.para = para;
    this.ts = ts;
  };


  public Equation derivative() {
    return new Equation(eq, nums, para, ts);
  }

  public void addElement(String elt) {
    //Expects "N0;2" N0 = 2
    
    String[] splitElt = elt.split(";");

    if (splitElt[0].split("")[0].equals("N")) {
      eq += "N" + Integer.toString(nums.size());
      nums.add(Float.parseFloat(splitElt[1]));
    } else if (splitElt[0].split("")[0].equals("P")) {
      eq += "P" + Integer.toString(para.size());
      nums.add(Float.parseFloat(splitElt[1]));
    } else if(splitElt[0].equals("x") || splitElt[0].equals("e")){
       eq += splitElt[0];
    }

    eq += " ";
  }

  public String getWritten() {
    System.out.println(eq);
    String[] splitEq = eq.split(" ");
    String returnString = "";

    for (int i = 0; i < splitEq.length; i++) {
      String temp = splitEq[i];
      String[] splitTemp = temp.split("");

      if (splitTemp[0].equals("N")) {
        float tempNum = nums.get(Integer.parseInt(splitTemp[1])); 
        if (round(tempNum) == tempNum) {
          returnString += (int) tempNum;
        } else
          returnString += tempNum;
      }else if(splitTemp[0].equals("P")){
        returnString += "(";
        returnString += ts.getEqs().get(Integer.parseInt(temp.split("P")[1]) + 1).getWritten();
        returnString += ")";
      }
      
      
    }

    return returnString;
  }


  public float evaluate(float input) {
    return input;
  }
}