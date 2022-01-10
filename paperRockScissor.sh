#! /usr/bin/bash

: '
	This script allows the user to play a Rock Paper Scissors game against the Computer(https://en.wikipedia.org/wiki/Rock_paper_scissors).
	The script is based on 3 functions: chooseSign, compare and main and on an array
	I choose the until loop as a test.
	THIS IS VERSION: 1.0.0
	TODOS:
	[] implement a method which catches not allowed strings entered by user(like default in switch)
	[] all user inputs must be converted in lowercase/case insensitive
	[] add and show some kind of statistics e.g. number of overall played games / wins /losses  
 
'


declare -a signs=("Rock" "Paper" "Scissors")

HCHOOSE="" #HUMAN CHOICE
PLAY="" #User choose to play or not
ENDOFGAME="Nice match, goodbye"
DONTPLAY="Alright goodbye then"

# This function determine the computer choice from the signs array
chooseSign(){
cplays=$((0 + $RANDOM %3))
echo  ${signs[$cplays]}

}

# This function compare the computer choice with the user choice in order to establish a winner if any
compare(){
  res=$(chooseSign)
USERWON="Computer chose ${res}, You won"
TIE="Computer chose ${res} and you as well, it's a tie!"
COMPUTERWON="Computer chose ${res} , Computer won"

 #echo $res
	if [ $res == "Rock" ];then
		if [ $HCHOOSE == "s" ];then
			echo $COMPUTERWON
		elif [ $HCHOOSE == "p" ];then
			echo $USERWON
		else
			echo $TIE
		fi
	fi
	if [ $res == "Paper" ];then
		if [ $HCHOOSE == "r" ];then
			echo $COMPUTERWON
		elif [ $HCHOOSE == "s" ];then
			echo $USERWON
		else
			echo $TIE
		fi
	fi
	if [ $res == "Scissors" ];then
		if [ $HCHOOSE == "p" ];then
			echo $COMPUTERWON
		elif [ $HCHOOSE == "r" ];then
			echo $USERWON
		else 
			echo $TIE
		fi
	fi
}

#This is the main function which gets called at the end of the file and starts the game
main(){
	read -p "Do you wanna play Rock Paper Scissors? (y/n): " PLAY
	if [ "${PLAY,,}" = "y" ];then
		printf "\tTO PLAY: type r for ROCK, s for SCISSORS, or p for PAPER\n\tTO QUIT THE GAME: n\n"
		sleep 1 #this is just in order to make the user aware about the program commands  
			until [ "${HCHOOSE,,}" = "n" ];do
	
				echo "Computer made a choice"
				read -p "Your choice(r/s/p)?: " HCHOOSE
				if [ $HCHOOSE == "n"  ]; then
					break
				else
					compare
				fi
			done
	else
		echo $DONTPLAY
		exit
	fi
		echo $ENDOFGAME
	exit
}

main
