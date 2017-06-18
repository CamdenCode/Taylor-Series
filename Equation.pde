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
    } else if (splitElt[0].equals("P")) {
      eq += "P" + splitElt[1];
      nums.add(Float.parseFloat(splitElt[1]));
    } else if (splitElt[0].split("")[0].equals("C")) {
      eq += "C" + splitElt[1];
      nums.add(Float.parseFloat(splitElt[1]));
    } else if (splitElt[0].split("")[0].equals("S")) {
      eq += "S" + splitElt[1];
      nums.add(Float.parseFloat(splitElt[1]));
    } else if (elt.equals("x") || elt.equals("e") || elt.equals("+") || elt.equals("-") || elt.equals("*")) {
      eq += elt;
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

      // System.out.println(eq);

      if (splitTemp[0].equals("N")) {
        float tempNum = nums.get(Integer.parseInt(splitTemp[1])); 
        if (round(tempNum) == tempNum) {
          returnString += (int) tempNum;
        } else
          returnString += tempNum;
      } else if (splitTemp[0].equals("P")) {
        returnString += "(";
        println(temp);
        returnString += ts.getEqs().get(Integer.parseInt(temp.split("P")[1])).getWritten();
        returnString += ")";
      } else if (splitTemp[0].equals("C")) {
        returnString += "cos(";
        returnString += ts.getEqs().get(Integer.parseInt(temp.split("C")[1])).getWritten();
        returnString += ")";
      } else if (splitTemp[0].equals("S")) {
        returnString += "sin(";
        returnString += ts.getEqs().get(Integer.parseInt(temp.split("S")[1])).getWritten();
        returnString += ")";
      } else if (splitTemp[0].equals("x") || splitTemp[0].equals("e") || splitTemp[0].equals("+") || splitTemp[0].equals("-") || splitTemp[0].equals("*")) {
        returnString += splitTemp[0];
      }
    }

    return returnString;
  }


  public float evaluate(float x) {
    float result;

    String[] splitEq = eq.split(" ");
    String returnString = "";
    

    for (int i = 0; i < splitEq.length; i++) {
      String temp = splitEq[i];
      String[] splitTemp = temp.split("");

      // System.out.println(eq);

      if (splitTemp[0].equals("N")) {
        float tempNum = nums.get(Integer.parseInt(splitTemp[1]));
      } else if (splitTemp[0].equals("P")) {
        
      } else if (splitTemp[0].equals("C")) {
      } else if (splitTemp[0].equals("S")) {
      } else if (splitTemp[0].equals("x") || splitTemp[0].equals("e")) {
      }
    }


    return x;
  }
}