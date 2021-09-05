public class Bonus {
  private float xPos;// Declaring the variables as private. I only want these variables to be used within this class.
  private float yPos;
  private float speedX;
  private float speedY;
  private float diameter;

  public Bonus() {
  }

  public Bonus(float diameter) {
    setDiameter(diameter); 
    reset();
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

  public void reset() { //When the ball hits the bottom of the window the ball will reset.
    xPos = random(width);
    yPos = random(0);
    speedX = random(8, 11);
    speedY = random(8, 11);
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
      reset(); // Calling the reset method once the ball goes out of the bottom border
    }

    if (yPos < diameter/2) {
      yPos = diameter/2;
      speedY = speedY * -1;
    }
  }

  public void display() {
    noStroke();
    fill(0, 0, 255);
    ellipse(xPos, yPos, diameter, diameter);
  }
}
