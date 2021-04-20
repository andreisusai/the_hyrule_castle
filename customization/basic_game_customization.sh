#!/bin/bash

# Function to chose the difficulty
difficulty=0;
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

export -f chose_difficulty 

