#!/bin/bash

source "customization/basic_game_customization.sh"
source "fights/fight.sh"

#Game variables                                                                      

export quitGame=0
echo "For new game press 1 ==================== To quit press another button"
read newGame


# Game Loop

game(){

    # Game Loop                                                                                                                     
while [ $quitGame -lt $newGame ]; do
    
    chose_difficulty
    
    while [[ $difficulty -eq 0 ]]; do
        chose_difficulty
        
    done

    display_characters

    fight
    newGame=$newGame
done
    
}
if [[ $newGame -eq 1 ]]; then
    game
fi