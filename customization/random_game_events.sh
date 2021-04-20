#!/bin/bash

randomHp=0

room(){

    random=$((1 + $RANDOM % 3))

    if [[ $random -eq 1 ]]; then
        randomHp=0
        echo "
==============================================            
This room is empty. You go to the next fight ||
==============================================
"

    elif [[ $random -eq 2 ]]; then
        randomHp=-15
        echo "
==========================================
You were in the Trap Room and lost 15 Hp ||
==========================================
"

    elif [[ $random -eq 3 ]]; then
        randomHp=45
            echo "
=============================================
You were in the Treasure Room and won 45 Hp ||
=============================================
"
    fi
}
