#!/bin/bash
#This script shows information about the computer
name=$1

case "$name" in
	"cpu" )
		if [[ -z $2 ]]
		then
			cd /proc/; cat cpuinfo
		fi

		while [ -n "$2" ]
		do
			case "$2" in
				-c) cat /proc/cpuinfo | grep 'cpu cores';;
				-n) cat /proc/cpuinfo | grep 'model name';;
				-f) cat /proc/cpuinfo | grep 'flags';;
				*) echo "invalid key: <key>!"
				echo "Use:"
 				echo "-c to get cpu cores"
				echo "-n to get model name"
				echo "-f to get flags of cpu"
			esac
		shift
		done
		;;
	"ram" )
		if [[ -z $2 ]]
                then
			cd /proc/; cat meminfo
		fi

		while [ -n "$2" ]
                do
                	case "$2" in
                		-c) cat /proc/meminfo | grep 'Cached';;
                		-u) cat /proc/meminfo | grep 'Active';;
                		-f) cat /proc/meminfo | grep 'MemFree';;
				*) echo "invalid key: <key>!" 
                                echo "Use:"
                                echo "-c to get Cashed ram"
                                echo "-n to get Active ram"
                                echo "-f to get MemFree"
                	esac
                shift
                done
		;;
	*)
		echo "Enter cpu or ram if you want to wantch information about this component"
		;;
esac
