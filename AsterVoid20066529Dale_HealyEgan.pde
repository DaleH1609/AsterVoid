import javax.swing.*;

/*
Declaring my objects from each class. 
 I decided to make a class for each object to give me better control of collision detection.
 */

Ship ship; 

Asteroid[] asteroid; //Declaring an object array of asteroid.

Satellite satellite;

Bonus bonus;

Player player;

/*
Declaring my global variables as they are used in multiple methods throughout the main class.
 */

int score = 0;
int numberOfAsteroids = Integer.parseInt(JOptionPane.showInputDialog("How many asteroids do you want to face: \n1 Very easy\n2 Easy\n3 Medium \n4 Hard \n5 Very hard \n10 NIGHTMARE MODE", "3"));
int numberOfLives = 5;
int numberOfGames= Integer.parseInt(JOptionPane.showInputDialog("Welcome to the AsterVoid, type the number of extra lives you would like: ", "3"));
int numberOfGamesPlayed =0;

void setup() {
  String instructions = "Use the up, down, left, right arrow keys on your keyboard to guide the rocket.\nYou have 5 lives. every time you get hit the ship gets smaller to make it easier\nCollect as many satellites as you can to score points\nCollect the bonus flashing satellite for double points.";
  JOptionPane.showMessageDialog(null, instructions.toUpperCase()); //Using a JOption to show instructions at the start of the game
  size (1280, 720);
  noCursor();
  ship = new Ship(50, 50); //Creating my ship object of Ship class. User controled ship (green square).
  asteroid = new Asteroid[numberOfAsteroids]; //Using an object array of asteroids (red balls). Using the numberOfAsteroids to take in user input to decide the difficulty of the game.
  satellite = new Satellite(50); //Creating a satellite object of class Satellite(green ball). 
  bonus = new Bonus(50); //Creating a bonus satellite of class Bonus (blue ball)
  player = new Player(JOptionPane.showInputDialog("Enter the player name: "), numberOfGames);
  for (int i = 1; i <= asteroid.length; i++) {
    asteroid[i-1] = new Asteroid(random(51, 99)); //Looping through the object array using a for loop and using the random method to generate different size asteroids.
  }
}

void draw() {
  background(0);
  ship.updateBorder(); // Method which controls border restrctions of the ship
  ship.display(); // Method to display the ship
  moveShip(); // moveShip() method which can be found on **LINE 131**
  satellite.display(); // Method to display the satellite (green ball)
  satellite.update(); // Updates the boundaries of the satellite (green ball) so it does not bounce out of window.
  bonus.update(); // Bonus ball which resets once it reaches the higher then 720 on the Y axis.
  bonus.display(); // Method to display the blue bonus ball
  fill(255, 0, 0);
  rect(0, 0, 1280, 200); //Red boundary zone at the top of the window.
  for (int i=0; i < asteroid.length; i++) { //Using a for loop to iterate through the object array of asteroids (Red balls)
    asteroid[i].display();
    asteroid[i].update();
  }
  fill(0);
  textSize(40);
  text("RED ZONE STAY AWAY", 450, 100);

  boolean collection = hitSatellite(ship, satellite); //Using boolean variable to detect other boolean method located on **LINE XX**
  if (collection) {
    satellite.reset(); //Satellite gets a random coordinate every time the ship collects it.
    score++; //Score plus one for satellite collection
    println("You have collected a satellite. Your score now is: " + score);
  }

  boolean bonusSatellite = hitBonus(ship, bonus);  //Using boolean variable to detect other boolean method located on **LINE XX**
  if (bonusSatellite) { // 
    bonus.reset();  //Bonus satellite gets a random coordinate every time the ship collects it.
    score += 2; 
    println("You have collected a bonus satelltie! 2 points! Total score is: " + score);
  }

  boolean collision = hitShip(ship, asteroid); //Using boolean variable to detect when the asteroid makes a collision with the ship.
  if (collision) {
    ship.setShipHeight(ship.getHeight()-5); //When collision is detected the ship will lose 5 in both height and width causing it to go smaller.
    ship.setShipWidth(ship.getWidth()-5);
    numberOfLives--;
    println("You've been struck! You have lost a life " + numberOfLives + " left");
    for (int i=0; i <asteroid.length; i++) {
      asteroid[i].reset(); //When the ship is hit the .reset() method is called to place the asteroids back at the top of the screen to prevent the ship getting hit multiple times.
    }
  }

  if (numberOfGames <= 0) { // When the number of lives reaches zero the game will display an ok message to show the leaderboard.
    JOptionPane.showMessageDialog(null, "We have no more ships to launch! Click OK to see the leaderboard");
    tournamentOver();
  }

  if (numberOfLives <= 0) {
    player.addScore(score);
    int reply = JOptionPane.showConfirmDialog(null, "Game over! You scored " + score + ".\nYou have " + (numberOfGames - 1) + " lives remaining ", 
      "Continue?", 
      JOptionPane.YES_NO_OPTION);
    if (reply == JOptionPane.YES_OPTION) {
      ship.setShipHeight(50); //Ship size is reset once the next game starts.
      ship.setShipWidth(50);
      resetGame();
      numberOfGames--;
      numberOfGamesPlayed++;
    } else {
      tournamentOver();
    }
  }
}

void tournamentOver()  // When the tournament is over the following message will be displayed hsoing the highest score, lowest score and average score.
{
  JOptionPane.showMessageDialog(null, player.getPlayerName() + ", your mission is over! \n\n"  
    + "Number of games played: " + numberOfGamesPlayed
    + "\n\n"                     + player.toString()
    + "\n\nHighest Score: "      + player.highestScore()
    +   "\nLowest Score:  "      + player.lowestScore()
    +   "\nAverage Score: "      + player.averageScore());
  exit();
}

void resetGame() // When the ship has lost it's 5 lifes. The user will have an option to play again and reset the life counter
{
  println("Your ship has been destroyed");
  println("Launching a new ship...");
  numberOfLives = 5;
  score = 0;
}

/*
Method to control the ship using getters and setters. Using keylogger to detect when arrow keys are pressed.
 */
void moveShip() { 
  if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        ship.setYPos(-10 + ship.getYPos());
      } else if (keyCode == DOWN)
      {
        ship.setYPos(10 + ship.getYPos());
      } else if (keyCode == LEFT)
      {
        ship.setXPos(-10 + ship.getXPos());
      } else if (keyCode == RIGHT)
        ship.setXPos(10 + ship.getXPos());
    }
  }
}

/*
 Rectangle Point Collision to detect when the circle and square make contact. I 
 made a variable for the 4 points of the square and then made a variable for 4 points of the ellipse.
 I used the logical || operator to detect when they were not colliding.
 I then used a single if statment with ! operator to detect a collision.
 */

boolean hitShip(Ship ship, Asteroid []asteroid) {

  float leftShip = ship.getXPos();
  float rightShip = ship.getXPos() + ship.getWidth();
  float topShip = ship.getYPos();
  float bottomShip = ship.getYPos() + ship.getHeight();
  for (int i=0; i<asteroid.length; i++) {
    float asteroidLeft = asteroid[i].getXPos() - asteroid[i].getDiameter()/2;
    float asteroidRight = asteroid[i].getXPos() + asteroid[i].getDiameter()/2;
    float asteroidTop = asteroid[i].getYPos() + asteroid[i].getDiameter()/2;
    float asteroidBottom = asteroid[i].getYPos() - asteroid[i].getDiameter()/2;
    if (!(leftShip > asteroidRight || rightShip < asteroidLeft || topShip < asteroidBottom || bottomShip > asteroidTop)) {
      return true;
    }
  }
  return false;
}


/*
Used the dist function to find the distance between two points. If the coordinates are les the the diameter the boolean tiggers true.
 */

boolean hitSatellite(Ship ship, Satellite satellite)
{
  if (dist(ship.getXPos(), ship.getYPos(), satellite.getXPos(), satellite.getYPos()) < satellite.getDiameter()) {
    return true;
  } else
  {
    return false;
  }
}

/*
Used the dist function to find the distance between two points. If the coordinates are les the the diameter the boolean tiggers true.
 */

boolean hitBonus(Ship ship, Bonus bonus) // Collision detection for the Bonus ball (multi colour ball)
{
  if (dist(ship.getXPos(), ship.getYPos(), bonus.getXPos(), bonus.getYPos()) < bonus.getDiameter()) { //X and Y position of both the ship and bonus ball
    return true;
  } else
  {
    return false;
  }
}
