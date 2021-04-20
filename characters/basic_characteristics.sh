#!/bin/bash

# Display and chose characters

display_characters(){
first_line=0
    echo "
    
=========== CHARACTERS ==========
    
    "
    
    while IFS="," read -r id name hp mp str int def res spd luck race class rarity  ; do

        if [[ $first_line -ne 0  ]]; then

            echo "
            
=========== $name =============

"
            
            echo "Name:" "$name"
            echo "Hp:" $hp
            echo "Mp:" $mp
            echo "Strenght:" $str
            echo "Int:" $int
            echo "Def:" $def
            echo "Res:" $res
            echo "Speed:" $spd
            echo "Luck:" $luck

            # Get the character's race

            first_line=0
            
            while IFS="," read -r id_race name strength weakness rarity  ; do

                if [[ $first_line -ne 0  ]]; then

                    if [[ $race -eq $id_race  ]]; then
                    
                    echo "Race:" "$name"
                    echo "Strenght:" $str
                    echo "Weakness:" $weakness
                    echo "Rarity:" $rarity

                    fi
                else
                    first_line=1
                fi

            done < src/races.csv

            # Get the character's classe

            first_line=0
            
            while IFS="," read -r id_class name strength weakness attack_type alignment rarity  ; do

                if [[ $first_line -ne 0  ]]; then

                    if [[ $class -eq $id_class ]]; then

                        echo "Class:" "$name"
                        echo "Strenght:" $strength
                        echo "Weakness:" $weakness
                        echo "Attack:" $attack_type
                        echo "Alignement:" $alignment
                        echo "Rarity:" $rarity

                    fi
                else
                    first_line=1
                fi

            done < src/classes.csv
            
            echo "Rarity:" $rarity
        else
            first_line=1
        fi
            
    done < src/players.csv
    
}

# Get the character's choice of the player

display_character(){
    
    first_line=0
    matching_name_character=0
    shopt -s nocasematch
    
    if [[ $matching_name_character -eq 0 ]]; then
    echo "
    
====== Please, insert the name character of your choice =======
    
    "
    fi
    read choice

    while IFS="," read -r id nameCharacter hp mp str int def res spd luck race class rarity  ; do

        if [[ $first_line -ne 0  ]]; then

            if [[ $(tr "[:upper:]" "[:lower:]" <<<"$choice") == $(tr "[:upper:]" "[:lower:]" <<<"$nameCharacter") ]]; then
            
            matching_name_character=0

            echo "

=========== $nameCharacter =============

"
            
            echo "Name:" "$nameCharacter"
            echo "Hp:" $hp
            echo "Mp:" $mp
            echo "Strenght:" $str
            echo "Int:" $int
            echo "Def:" $def
            echo "Res:" $res
            echo "Speed:" $spd
            echo "Luck:" $luck

            # Get the character's race                                                                                                                                                                                              

            first_line=0

            while IFS="," read -r id_race nameRace strengthRace weaknessRace rarityRace  ; do

                if [[ $first_line -ne 0  ]]; then

                    if [[ $(tr "[:upper:]" "[:lower:]" <<<"$race") = $(tr "[:upper:]" "[:lower:]" <<<"$id_race") ]]; then

                    echo "Race:" "$nameRace"
                    echo "Strenght:" $strengthRace
                    echo "Weakness:" $weaknessRace
                    echo "Rarity:" $rarityRace
                    race="$nameRace"
                    strenghtR=$strengthRace
                    weaknessR=$weaknessRace
                    rarityR=$rarityRace
                    fi
                else
                    first_line=1
                fi

            done < src/races.csv
            
            # Get the character's classe                                                                                                                                                                                            

            first_line=0

            while IFS="," read -r id_class nameClass strength weakness attack_type alignment rarity  ; do

                if [[ $first_line -ne 0  ]]; then

                    if [[ $class -eq $id_class ]]; then

                        echo "Class:" "$nameClass"
                        echo "Strenght:" $strength
                        echo "Weakness:" $weakness
                        echo "Attack:" $attack_type
                        echo "Alignement:" $alignment
                        echo "Rarity:" $rarity
                        class="$nameClass"
                        strengthC=$strength
                        weaknessC=$weakness
                        attack_typeC=$attack_type
                        alignmentC=$alignment
                        rarityC=$rarity
                    fi
                else
                    first_line=1
                fi

            done < src/classes.csv

            echo "Rarity:" $rarity
            break
          fi
        else
            matching_name_character=1
            first_line=1
        fi

    done < src/players.csv

    while [[ $matching_name_character -eq 1 ]]; do
        display_character
    done

}

# Get enemies

get_enemy(){

    echo "
    
======= Good Choice -> $nameCharacter  ======="

    echo "
    
======== You will fight  =========

"
    
    first_line=0

    randomId=$((1 + $RANDOM % 12))
    
    while IFS="," read -r id nameEnemy hpE mpE strE intE defE resE spdE luckE race class rarityE  ; do

        if [[ $first_line -ne 0  ]]; then

            if [[ $randomId -eq $id ]]; then
            
            echo "
            
=========== $nameEnemy =============
            
            "

            echo "Name:" "$nameEnemy"
            echo "Hp:" $hpE
            echo "Mp:" $mpE
            echo "Strenght:" $strE
            echo "Int:" $intE
            echo "Def:" $defE
            echo "Res:" $resE
            echo "Speed:" $spdE
            echo "Luck:" $luckE

            # Get the enemies race                                                                      

            first_line=0

            while IFS="," read -r id_race name strength weakness rarity  ; do

                if [[ $first_line -ne 0  ]]; then

                    if [[ $race -eq $id_race  ]]; then

                    echo "Race:" "$name"
                    echo "Strenght:" $strength
                    echo "Weakness:" $weakness
                    echo "Rarity:" $rarity
                    raceE="$name"
                    strenghtER=$strength
                    weaknessER=$weakness
                    rarityER=$rarity

                    fi
                else
                    first_line=1
                fi

            done < src/races.csv

            # Get the enemies classe
            
            first_line=0

            while IFS="," read -r id_class name strength weakness attack_type alignment rarity  ; do

                if [[ $first_line -ne 0  ]]; then

                    if [[ $class -eq $id_class ]]; then

                        echo "Class:" "$name"
                        echo "Strenght:" $strength
                        echo "Weakness:" $weakness
                        echo "Attack:" $attack_type
                        echo "Alignement:" $alignment
                        echo "Rarity:" $rarity
                        classE="$name"
                        strengthEC=$strength
                        weaknessEC=$weakness
                        attack_typeEC=$attack_type
                        alignmentEC=$alignment
                        rarityEC=$rarity
                    fi
                else
                    first_line=1
                fi

            done < src/classes.csv

            echo "Rarity:" $rarityE
            break
          fi
        else
            first_line=1
        fi

    done < src/enemies.csv

}

export -f display_characters display_character  get_enemy

