#!/bin/bash

get_boss(){

    first_line=0

    randomId=$((1 + $RANDOM % 7))
    
    while IFS="," read -r id nameBoss hpB mpB strB intB defB resB spdB luckB race class rarityB  ; do

        if [[ $first_line -ne 0  ]]; then

            if [[ $randomId -eq $id ]]; then
            
            echo "
            
=========== $nameBoss =============
            
            "

            echo "Name:" "$nameBoss"
            echo "Hp:" $hpB
            echo "Mp:" $mpB
            echo "Strenght:" $strB
            echo "Int:" $intB
            echo "Def:" $defB
            echo "Res:" $resB
            echo "Speed:" $spdB
            echo "Luck:" $luckB

            # Get the race of the boss           

            first_line=0

            while IFS="," read -r id_race name strength weakness rarity  ; do

                if [[ $first_line -ne 0  ]]; then

                    if [[ $race -eq $id_race  ]]; then

                    echo "Race:" "$name"
                    echo "Strenght:" $strength
                    echo "Weakness:" $weakness
                    echo "Rarity:" $rarity
                    raceB="$name"
                    strenghtBR=$strength
                    weaknessBR=$weakness
                    rarityBR=$rarity

                    fi
                else
                    first_line=1
                fi

            done < races.csv

            # Get the classe of the boss
            
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
                        classB="$name"
                        strengthBC=$strength
                        weaknessBC=$weakness
                        attack_typeBC=$attack_type
                        alignmentBC=$alignment
                        rarityBC=$rarity
                    fi
                else
                    first_line=1
                fi

            done < classes.csv

            echo "Rarity:" $rarityB
            break
          fi
        else
            first_line=1
        fi

    done < bosses.csv


                echo "
=====================================================================
                You encounter the boss ${nameBoss}
=====================================================================

                "
}