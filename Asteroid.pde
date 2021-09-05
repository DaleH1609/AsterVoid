public class Asteroid{
  private float xPos;// Declaring the variables as private. I only want these variables to be used within this class.
  private float yPos;
  private float diameter;
  private float speedX;
  private float speedY;

  public Asteroid() { //Default constructor
  }

  public Asteroid(float diameter) { 
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
    if ((diameter >= 100) && (diameter <= 50)) {
      this.diameter = diameter;
    } else {
      this.diameter = 70;
    }
  }

  public void display() { //Display asteroid (red ball)
    fill(255, 0, 0);
    noStroke();
    ellipse(xPos, yPos, diameter, diameter);
  }

  public void reset() { // Used to reset the asteroid (red ball) after it makes contact with the ship
    xPos = random(width);
    yPos = random(0);
    speedX = random(6, 9);
    speedY = random(6, 9);
  }

  public void update() { //Method to control the collision detection for the asteroid and the window border. Once a collision is detected on the border the SpeedX or Speed is multipled by -1.

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
}
