#!/bin/bash
DOTBASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DOTBASE
echo "Installing .gitconfig"
cp .gitconfig ~
set -e
echo -n "What hostname do you want: "
read PROMPTHOST
echo "PROMPTHOST=$PROMPTHOST" >> ~/.bash_profile
echo ". $DOTBASE/init.sh" >> ~/.bash_profile

for script in b2g.sh osx.sh
do 
	echo -n "Include $script (y/n): "
	read yno
	case $yno in
	[yY] )
		echo "Including..."
		echo ". $DOTBASE/$script" >> ~/.bash_profile
		;;
	* )
		echo "Skipping..."
		;;
	esac
done
