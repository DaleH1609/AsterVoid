/* Reflection

Name : Dale Healy Egan

Student Number: 20066529

Link to Video on YouTube: 

I made multiple takes as I wasn't happy with how most of them turned out. Here are my two best ones,
I just want to apologize for making one longer then 10 minutes so I added a shorter version in case.
Thanks very much.

https://youtu.be/qlprwWYhibs  -  10:47 version.  

https://youtu.be/TEFfVZZNKQE  -  7:54 version

Total score 78/100


Part A - Mark (11 /11)
-----------------------------

Includsion of completed:
- Readme             (1)
- Reflection        (5)
- Video            (5)

I have included readme, reflection and video. I am giving myself 11 out of 11. Video is length is 10:47 and points out the key aspects of the game and the code.

Part B - Mark (4 /4)
-----------------------------

Comments, 
- indentation, 
- naming, 
- structure of code.

I have used corrected indentation, I have used correct naming (camelCase) and the structure of my code is correct. I am giving myself 4 out of 4.

Part C - Mark (1 /5)
-----------------------------
Use of if and loop statements:
line 63 - if statement to validate if a boolean is true.
line 70 - if statement to validate if a boolean is true.
line 77 - if statement to validate if a boolean is true.
line 87 - if statement to validate if the user still has extra lives left. If no the game will automatically end.
line 92 - if statement to validate if the user has ran out of lives and if they want to continue playing or not.
line 97 - if statement used for a JOption Yes or No to validate if the user wants to continue or be shown the leaderboard.
line 132 - Nested if statement to validate keypressed.


for loops used on:
line 38 - for loop used to create asteroid objects depending on how many the user inputted.
line 54 - for loop used to display and update the asteroids on the screen.
line 165 - for loop used to iterate through the array of asteroids to detect collision detection.

I have only used one example of a loop and multiple if statements. I am giving myself a 1 out of 5.


Part D - Mark (10 /10)
-----------------------------
Working Game with inclusion of bespoke methods in the main sketch.

bespoke method:

line 131 - Working keyhandler that uses the up, down, left, right key arrows to determine the direction of the ship. This method is called in the main method.
Ship Class - line 47 - Working screen edge border detection to make sure the ship does not drift off screen.
line 158 to 174 - Collision detection for detecting when the ship has been hit. 
line 181 to 189 - Collision detection to detect when the ship has collected a satellite to gain a score.
line 195 - 204 - Collision detection to detect when the ship has collected a bonus satellite to gain plus 2 score.
line 120 to 126 - Reset game method to reset the lives of the player when they select yes for the JOptionPane_Yes_Or_No.
line 109 to 118 - Leaderboard showing the min, max , average score of the games played once done.

-----------------------------
Part E USER DEFINED CLASSES
-----------------------------

Part E1 - Mark (7 /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters

Overloaded constructor - Satellite Class - line 12 & 15 & 20 & 26 
Access modifiers - Satellite Class - line 62 & 69 & 94
Getters & Setters - Satellite Class - line 46 & 50 & 54 & 58



...

I am giving myself 7 out of 10 as I only provided an overloaded constructor within the Satellite Class. The rest of my classes contain fields, constructors, getters, setters and access modifiers

Part E2 - Mark (5 /10)
-----------------------------

Class bespoke methods:
Asteroid Class
update() on line 49 to 72 - No return value
reset() on line 42 - 47 - No return value
display() on line 36 to 40 - No return value

Satellite Class
Overloading examples - line 12 & 15 & 20 & 26
update() - line 69 to 91 - No return value
reset() - line 62 to 67

Bonus Class
update() - line 40 to 63 - No return value
reset() - line 33 to 38 - No return value
display() - 65 - 70 - No  return value

Player Class
highestScore() - line 24 - 33 - return value
addScore() - line 16 - 22 - accepting parameter

I am unsure of if I can add the player class methods to E2 to demonstrate return value and accepting parameters.
For this reason I am going to give myself a 5 as other then the player class I would not have a method that returns a value and one that accepts a parameter


Part E3 - Mark (7 /10)
-----------------------------

- The user-defined class(es) are used in an appropriate manner 

multiple declarations of user defined classes:
line 8 - Declaring an object of Ship **line 33** Initializing object.
line 10 - Declaring an object array of Asteroid **line 39** Initializing object.
line 12 - Declaring a object of Satellite **line 35** Initializing object.
line 14 - Declaring an object of Bonus **line 36** Initializing object.
line 16 - Delcaring an object of Player **line 37** Initializing object.

getters/setters are used on...
line 78 to 79 - I am using the setHeight, getHeight, setWidth, getWidth to change the height of the Ship every time the ship is hit.
line 98 to 99 - I am useing the setHeight, getHeight, setWidth, getWidth to reset the ship back to the original size.
line 131 to 149 - I am using the getXPos, setXPos, getYPos, setYPos to move the ship using the keylogger.
line 158 to 174 - Using the geShipHeight, getShipWidth, getXPos, getYPos, getDiameter to calculate collision detection.
line 181 to 189 - Using ship.getXPos, ship.getYPos, satellite.getXPos, satellite.getYPos to calculate collision detection
line 195 to 203 - Using ship.getXPos, ship.getYPos, bonus.getXPos, bonus.getYPos to calcualte collision deteciton

**No examples of overloaded constructors in the main class so I am giving myself a 7 out of 10 as I have used 3+ classes**

------------------------
PART F - DATA STRUCTURES
------------------------

Part F1 - Mark (20 /20)
-----------------------------
- Use of a data structure to store information i.e. array

Object array
line 10 - Declared an object array of asteroids
line 34 - Initialized the array using user input on line **23**
line 54 to 57 - Using the object array to display and update. Using .length as the user input is random.

Primitive array
line 25 - Taking user input for the amount of games that the user wants to play and passing it into an array when initilizing the player object **line 37**

I have one object array and one primitive array


Part F2 - Mark (13 /20)
-----------------------------
- Calculations performed on the information stored

Player Class - Max Score - line 24 to 33 - I am using an array called score to store results and then calculating the highest score from the X amount of games played.
Player Class - Min Score - line 35 to 44 - I am calculating the lowest score within the array.
Player Class - Average score - line 46 to 53 - I am calculating the average score of the array. The amount of games is user controlled and can be found on line **25** of the MAIN class.


FINAL CHECK:
I have checked the constraints and I am not breaking any constraints

*/
