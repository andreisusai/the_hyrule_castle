#!/bin/bash

# Function to chose the difficulty
difficulty=0;
number_of_fights=0;
chose_difficulty(){

    echo "Select a number to chose the difficulty                                                                                                          
         1 -> Normal    2 -> Difficulty   3 -> Insane ";
    
    read level

    if [[ $level -eq 1 ]]; then
        difficulty=1;
        
        echo "

You choosed Normal"
    elif [[ $level -eq 2  ]]; then
        difficulty=2;
        echo "
        
You choosed Difficult and every enemy statistics is multiplied by 2"
    elif [[ $level -eq 3  ]]; then
        difficulty=3;
        echo "
        
You choosed Insane and every enemy statistics is multiplied by 3"
    else
        difficulty=0; 
        echo "
        
You have to choose a number between 1 and 3 to set the difficulty of your game
==================================================================================

        "
    fi
    
}

# Set the number of fights

set_number_fights(){
    
    echo "
    
Select a number to chose the number of fights

         1 -> 10 fights   <===>   2 -> 20 fights   <===>   3 -> 50 fights < ===>   4 -> 100 fights";

    read numberFights
    
    if [[ $numberFights -eq 1 ]]; then
        number_of_fights=10
        echo "
        
You choosed 10 fights"
        
    elif [[ $numberFights -eq 2 ]]; then
        number_of_fights=20
        echo "
        
You choosed 20 fights"

    elif [[ $numberFights -eq 3 ]]; then
        number_of_fights=50
        echo "

You choosed 50 fights"

    elif [[ $numberFights -eq 4  ]]; then
        number_of_fights=100
        echo "
        
You choosed 100 fights"
    else
        number_of_fights=0
        echo "
        
You have to choose a number of fights to set your game. Choose a number between 1 and 4
==================================================================================

        "
    fi
}

export -f chose_difficulty set_number_fights 

