#!/bin/bash

# check conda install

# initialize env

# activate env
# conda activate $2

# get package list
pkg_list=`cat $1`
echo "Here is the package $1 list:"
counter=0
for pkg_name in $pkg_list; do
    counter=$(($counter+1))
    echo "$counter. $pkg_name"
done

# confirm
is_loop=0
until [ $is_loop -eq 1 ]
do
    echo "Proceed ([y]/n)?"
    read is_confirm
    # echo $is_confirm
    if [ "$is_confirm" = 'y' -o "$is_confirm" = 'Y' -o "$is_confirm" = 'yes' -o "$is_confirm" = 'Yes' -o "$is_confirm" = 'YES' ]
    then
        is_loop=1
    elif [ "$is_confirm" = 'n' -o "$is_confirm" = 'N' -o "$is_confirm" = 'no' -o "$is_confirm" = 'No' -o "$is_confirm" = 'NO' ]
    then
        exit 0
    else
        is_loop=0
    fi
done

# install
for pkg_name in $pkg_list; do
    echo "Installing $pkg_name"
    conda install $pkg_name
done

# finish
echo "All the installation is done!"
