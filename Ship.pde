public class Ship {
  private float xPos;// Declaring the variables as private. I only want these variables to be used within this class.
  private float yPos;
  private int shipHeight;
  private int shipWidth;

  public Ship() { //Default constructor
  }

  public Ship(int shipHeight, int shipWidth) {
    setShipHeight(shipHeight);
    setShipWidth(shipWidth);
  }

  public float getXPos() {
    return xPos;
  }

  public float getYPos() {
    return yPos;
  }

  public int getHeight() {
    return shipHeight;
  }

  public int getWidth() {
    return shipWidth;
  }

  public void setXPos(float xPos) {
    this.xPos = xPos;
  }

  public void setYPos(float yPos) {
    this.yPos = yPos;
  }

  public void setShipHeight(int shipHeight) {
    this.shipHeight = shipHeight;
  }
    
  public void setShipWidth(int shipWidth) {
     this.shipWidth = shipWidth;
   }

  public void updateBorder() { //Border detection so the ship does not move off screen
    if (yPos < 200) {
      yPos = 200; //Stops this ship from entering the RED ZONE at the top of the window to allow more space for the asteroids to maneuver and add difficulty to the game.
    }

    if (xPos > width - shipWidth) {
      xPos = width - shipWidth;
    }

    if (xPos < 0)
      xPos = 0;

    if (yPos > height - shipHeight) {
      yPos = height - shipHeight;
    }
  }

  public void display() { //Display ship (green square)
    fill(0, 255, 0);
    noStroke();
    rect(xPos, yPos, shipWidth, shipHeight);
  }
}
