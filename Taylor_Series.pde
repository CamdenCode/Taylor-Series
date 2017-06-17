public int STATE = 0;

int state = 0;
boolean exp = false;

int funcBoxY;
int funcBoxHeight;

ArrayList<Integer> paraPath = new ArrayList<Integer>();

ArrayList<Equation> equations = new ArrayList<Equation>();

String displayGoal;

void setup() {
  size(1200, 900);
  funcBoxY = height - 500;
  funcBoxHeight = 90;
  //Goal
  equations.add(new Equation("", new ArrayList<Float>(), new ArrayList<Equation>(), this));
  paraPath.add(0);
}

void draw() {
  displayGoal = equations.get(0).getWritten();
  background(51);
  fill(220);
  rect(10, funcBoxY, width - 20, funcBoxHeight);
  fill(0);
  textSize(funcBoxHeight - 20);
  text("f(x) = " + displayGoal, 12, funcBoxY + (funcBoxHeight / 2) + 20);
  println(paraPath);
}



void keyPressed() {
  
  
  
  //If we're inputting
  if (state == 0) {
    
    if (!exp) {
      if (key >= 48 && key <= 57) {
        int N0 = key - 48;
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("N0;" + N0);
      } else if (key == 120) {
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("x ");
      } else if (key == 101) {
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("e ");
      } else if (key == 43) {
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("+ ");
      } else if (key == 45) {
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("- ");
      } else if (key == 40) {
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("P;" + equations.size());
        paraPath.add(equations.size());
        equations.add(new Equation("", new ArrayList<Float>(), new ArrayList<Equation>(), this)); 
      } else if (key == 41) {
        paraPath.remove(paraPath.get(paraPath.size() - 1));
      } else if (key == 99) {
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("C;" + equations.size());
        paraPath.add(equations.size());
        equations.add(new Equation("", new ArrayList<Float>(), new ArrayList<Equation>(), this));  
      } else if (key == 115) {
        equations.get(paraPath.get(paraPath.size() - 1)).addElement("S;" + equations.size());
        paraPath.add(equations.size());
        equations.add(new Equation("", new ArrayList<Float>(), new ArrayList<Equation>(), this));  
      }
    }
  }
}

public ArrayList<Equation> getEqs(){
    return equations;
}