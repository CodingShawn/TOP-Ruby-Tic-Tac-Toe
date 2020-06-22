# TOP-Ruby-Tic-Tac-Toe

User Interface:
Game board will be displayed and 2 players will be able to take turns to mark a spot to place their pieces

Input:
Players' choices of where to mark a spot

Output:
Game board will be updated to show where players' marked the spots as well as to show who wins after win conditions are 
med

Pseudocode:
Player Class:
    Will interact with Board class to select where to place pieces
    Pieces placed will be represented by X or O

Board Class:
    Will display the game board as well as locations of marked spots
    Take input from players to determine where to show marked spots

Game Class:
    Will ask for players input in turns
    Prevent illegal moves from players
    Pass on information from Player Class to Board Class
    To check if win conditions has been met

