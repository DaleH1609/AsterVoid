public class Player{
  private String playerName; // Declaring the variables as private. I only want these variables to be used within this class.
  private int[] scores;// Initilizaing an array to contain score count of each game played.
  private int count;
  
  public Player(){
  }
  
  public Player(String playerName, int numberOfGames)
  {
    this.playerName = playerName;
    scores = new int[numberOfGames];
    count = 0;
  }
  
  public void addScore(int score)
  {
    if(score >= 0){
      scores[count] = score;
      count++;
    }
  }
  
  public int highestScore()
  {
    int highestScore = scores[0];
    for(int i = 1; i < scores.length; i++){
      if (scores[i] > highestScore){
        highestScore = scores[i];
      }
     }
     return highestScore;
  }
  
  public int lowestScore()
  {
    int lowestScore = scores[0];
    for(int i = 1; i < scores.length; i++){
      if(scores[i] < lowestScore){
        lowestScore = scores[i];
      }
    }
    return lowestScore;
  }

  public int averageScore()
  {
    int total = 0;
    for(int i = 0; i < scores.length; i++){
      total = total + scores[i];
    }
    return total / count;
  }
  
  public String getPlayerName()
  {
    return playerName;
  }
  
  public int[] getscores()
  {
    return scores;
  }
  
  public String toString()
  {
    String str = "Scores for " + playerName + "\n";
    
    for(int i = 0; i < count; i++){
      str = str + " Score " + (i+1) + ": " + scores[i] + "\n";
    }
    return str;
  }
  
  public void setPlayerName(String playerName)
  {
    this.playerName = playerName;
  }
}
