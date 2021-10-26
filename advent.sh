#!/usr/bin/env bash

orange='\033[0;33m'
red='\033[0;31m'
yellow='\033[1;33m'
nc='\033[0m' # no color

adventNr=0

flameCore=$orange"("$red"|"$orange")"$yellow

flame1L=("   )   " "  ) \  " " / "$red")"$yellow" ( " " \\\\"$flameCore"/ ")
flame1M=("       " "  )\   " " / "$red")"$yellow")  " " \\\\"$flameCore"  ")
flame2L=("   (   " "  / (  " " ) "$red")"$yellow" \ " " \\\\"$flameCore"/ ")
flame2M=("       " "   /(  " "  ("$red"("$yellow" \ " "  "$flameCore"/ ")
flame1S=("       " "       " "   "$orange")"$yellow"   " "  "$flameCore"  ")
flame2S=("       " "       " "   "$orange"("$yellow"   " "  "$flameCore"  ")

candle=(" .-;-. " "|'-=-'|" "|     |" "|     |" "|     |" "|     |" "'.___.'")

flamesLine1=("${flame1L[0]}" "${flame2M[0]}" "${flame1S[0]}" "${flame1M[0]}" "${flame2L[0]}" "${flame1M[0]}" "${flame2S[0]}" "${flame2M[0]}")
flamesLine2=("${flame1L[1]}" "${flame2M[1]}" "${flame1S[1]}" "${flame1M[1]}" "${flame2L[1]}" "${flame1M[1]}" "${flame2S[1]}" "${flame2M[1]}")
flamesLine3=("${flame1L[2]}" "${flame2M[2]}" "${flame1S[2]}" "${flame1M[2]}" "${flame2L[2]}" "${flame1M[2]}" "${flame2S[2]}" "${flame2M[2]}")
flamesLine4=("${flame1L[3]}" "${flame2M[3]}" "${flame1S[3]}" "${flame1M[3]}" "${flame2L[3]}" "${flame1M[3]}" "${flame2S[3]}" "${flame2M[3]}")

while true
do
  for(( k=0; k<${#flamesLine1[*]}; k++ ))
  do
    declare -i dateNr=$(date +%m%d)

    if (( $dateNr >= 1219 ))
    then
      adventNr=4
    elif (( $dateNr >= 1212 ))
    then
      adventNr=3
    elif (( $dateNr >= 1205 ))
    then
      adventNr=2
    elif (( $dateNr >= 1128 ))
    then
      adventNr=1
    else
      adventNr=0
    fi

    line1="\n"$yellow
    line2="\n"$yellow
    line3="\n"$yellow
    line4="\n"$yellow

    for(( i=0; i<$adventNr; i++ ))
    do
      line1=$line1"${flamesLine1[(($k+$i))%4]}""   "
      line2=$line2"${flamesLine2[(($k+$i))%4]}""   "
      line3=$line3"${flamesLine3[(($k+$i))%4]}""   "
      line4=$line4"${flamesLine4[(($k+$i))%4]}""   "
    done

    printf "$line1"
    printf "$line2"
    printf "$line3"
    printf "$line4"

    for(( j=0; j<${#candle[*]}; j++ ))
    do
      printf "\n"$nc"${candle[$j]}""   ""${candle[$j]}""   ""${candle[$j]}""   ""${candle[$j]}"
    done

    sleep .3
    clear
  done
done
