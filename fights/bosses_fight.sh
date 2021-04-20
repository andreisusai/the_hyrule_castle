#!/bin/bash

source "characters/bosses.sh"

fight_boss(){

currentHpB=$hpB

while [[ $coins -gt 0 ]]; do

    read  bossattack

    if [[ $bossattack -eq 1 ]]; then
        
        currentHp=$((currentHp-30))
        currentHpB=$((currentHpB-15))

            echo "
================================================
You attacked and dealt 15 damages
${nameCharacter} Hp ${currentHp}
                                                
"
            echo "                            
${nameBoss} attacked and dealt 30 damages
Boss Hp ${currentHpB} 
================================================
"
        # Decrease coins
        if [[ $currentHp -le 0 ]]; then
            
            coins=$((coins-1))
            currentHp=$hp
            echo "
========================================
You have ${coins} coins out of 12 left 
========================================
"

        fi

        if [[ $coins -eq 0 ]]; then
            echo "
                Game over...
                You lost !
                Press 1 to start a new game ==================== Press 0 to quit   
            "
                read newGame
                export newGame
                break;

        fi

        if [[ $currentHpB -le 0  ]]; then

                    echo "
    ===================================================================
                    You destroyed the boss ${nameBoss} !
                            CONGRATULATIONS !!!
    ==================================================================="
                            
                    echo "
    Press 1 to start a new game ==================== Press 0 to quit"
                    read newGame
                    export newGame
                    break;
        fi
    fi
done

}
