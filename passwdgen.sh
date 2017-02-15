#!/bin/sh
# Shell script to generate random passwords
# and copy it to clipboard
# for my personal use

password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=' | fold -w 10 | grep -i '[!@#$%^&*()_+{}|:<>?=]' | head -n 1 ; echo -n)

echo "Password : " $password
echo -n $password | xclip -selection clipboard

echo "Password copied to clipboard."
