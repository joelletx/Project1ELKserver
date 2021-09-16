#!/bin/bash

mystates=('Texas' 'New York' 'Hawaii' 'Alaska' 'Colorado')

for state in ${mystates[@]}
do
     if [ $state == 'Hawaii' ]
     then
	echo  "Hawaii is the best!"
     else
	echo "I'm not fond of Hawaii."
     fi
done
