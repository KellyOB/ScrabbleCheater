# Scrabble Cheater
Week 11 Exercise for Devslopes Academy

Build a Scrabble Cheating app.

1. When the game starts the user is given 7 letters at random. 
These letters must be picked from a "bag" -- meaning you don't just randomly pick from an infinite amount of letters, but pick from the bag just like in the real life game. See the details on bag size below
Remember, each time a letter is given to the user it must be removed from the bag before you can give another at random

2.  The user will press a button or type in "cheat". A list of every possible word that the user can make will print out along with how many points the word is worth. ie "Car - 5 Points"

3.  We were givng a TXT (dictionary.txt) file with a list of the approved words. You will need to use this file (parse it) to check valid words.

4.  YOU CANNOT STORE YOUR DICTIONARY IN AN ARRAY

5.  You cannot read from the dictionary.txt file real time for word lookups (it must be parsed and stored only once)

6.  You can use arrays for other parts of the app, just not for word matching/dictionary storage
The user can tap restart or type "restart" to restart the game and get 7 new letters
