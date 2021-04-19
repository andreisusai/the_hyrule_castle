#!/bin/bash

fightEnd=1

room(){

    if [[ $fightEnd -eq 1  ]]; then

        random=$((1 + $RANDOM % 3))

        if [[ $random -eq 1 ]]; then

            echo "You go to the next fight"

        elif [[ $random -eq 2 ]]; then

            echo "You are in the Trap Room"

        elif [[ $random -eq 3 ]]; then

             echo "You are in the Treasure Room"
        fi
    fi
}

room
