#!/bin/bash

source "basic_game_customization.sh"
source "fight.sh"

#Game variables                                                                      

export quitGame=0
echo "New game press 1 ==================== Press 0 to quit"
read newGame


# Game Loop

game(){

    # Game Loop                                                                                                                     
while [ $quitGame -lt $newGame ]; do
    
    chose_difficulty
    
    while [[ $difficulty -eq 0 ]]; do
        chose_difficulty
        
    done

    set_number_fights

    while [[ $number_of_fights -eq 0 ]]; do
        set_number_fights
    done

    display_characters

    fight
    newGame=$newGame
done
    
}

game