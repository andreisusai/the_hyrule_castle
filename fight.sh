#!/bin/bash
source "basic_game_customization.sh"
source "basic_characteristics.sh"
source "bosses_fight.sh"

fight(){    

    display_character
    
    get_enemy

    count=9
    coins=12
    currentHp=$hp
    currentDifficulty=$difficulty
    HpE=$hpE
    currentHpE=$((HpE*currentDifficulty))

    echo "
==================================================
You have ${coins} coins to begin with. Good Luck!
==================================================

"
    
    while [ $coins -gt 0 ];do

        echo "
        =========== FIGHT ${count} ==========

"
        echo $nameEnemy
        echo $currentHpE
        echo "

             "
        echo $nameCharacter
        echo $currentHp
        echo "
        
            "
        echo "--------- Options ---------
Press 1 to attack

You encounter a ${nameEnemy}
             "        
        read  attack

        if [[ $attack -eq 1 ]]; then

            currentHp=$((currentHp-10))
            currentHpE=$((currentHpE-15))

            echo "
================================================
You attacked and dealt 15 damages     
                                                
"
            echo "                            
${nameEnemy} attacked and dealt 10 damages    
================================================
"

            # Decrease coins
            if [[ $currentHp -le 0 ]]; then
            coins=$((coins-1))
            currentHp=$hp
            echo "You have ${coins} coins out of 12 left"

            fi

            if [[ $currentHpE -le 0  ]]; then
                # When count equal to 10 a boss is encounter
                if [[ $count -eq 10 ]]; then
                    get_boss
                    fight_boss
                    export newGame=$newGame
                    break;
                fi

                                echo "
===================================================================
You destroyed ${nameEnemy} and get to go to the next floor !      
==================================================================="
                get_enemy
                currentDifficulty=$difficulty
                HpE=$hpE
                currentHpE=$((HpE*currentDifficulty))
                count=$((count+1))

            fi
            
          fi      
    done
    
}

export -f fight
