public class Satellite {
  private float xPos;// Declaring the variables as private. I only want these variables to be used within this class.
  private float yPos;
  private float speedX;
  private float speedY;
  private int red;
  private int green;
  private int blue;
  private int gray;
  private float diameter;
  
  public Satellite(){ //Default constructor
  }

  public Satellite(float diameter) {
    this.diameter = diameter;
    reset();
  } 
  
  public Satellite(float diameter, int gray) {
    setDiameter(diameter); 
    colour(gray);
    reset();
     } 
  
  public Satellite(float diameter, int red, int green, int blue) { //Showing example of overloaded constructor NOT CALLED IN MAIN
    setDiameter(diameter); 
    colour(red, green, blue);  
    reset();
  } 

  public void colour(int red, int green, int blue) {
    this.red = red;
    this.green = green;
    this.blue = blue;
    fill(this.red, this.green, this.blue);
  }


  public void colour(int gray) {
    this.gray = gray;
    fill(this.gray);
  }


  public float getXPos() {
    return xPos;
  }

  public float getYPos() {
    return yPos;
  }

  public float getDiameter() {
    return diameter;
  }

  public void setDiameter(float diameter) {
    this.diameter = diameter;
  }

  public void reset() {
    xPos = random(width);
    yPos = random(0);
    speedX = random(5, 7);
    speedY = random(5, 7);
  }

  public void update() {

    xPos = xPos + speedX;
    yPos = yPos + speedY;

    if (xPos > width - diameter/2) {
      xPos = width - diameter/2;
      speedX = speedX * -1;
    }

    if (xPos < diameter/2) {
      xPos = diameter/2;
      speedX = speedX * -1;
    }

    if (yPos > height - diameter/2) {
      yPos = height - diameter/2;
      speedY = speedY * -1;
    } else if (yPos < diameter/2) {
      yPos = diameter/2;
      speedY = speedY * -1;
    }
  }


  public void display() {
    noStroke();
    fill(0,255,0);
    ellipse(xPos, yPos, diameter, diameter);
  }
}
