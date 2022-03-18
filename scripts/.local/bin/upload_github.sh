#!/usr/bin/env bash
# This script is used to add the github remote in a bunch
# of repos that are on the same folder, then push it to github.
# (Alert: you have to create each repo, with the same name,
# on your github account, and add the ssh key to your account also.)

for f in */
do
	cd $f
	git remote remove github
	git remote add github git@github.com:owariee/${f%*/}.git
	git push -u github master
	cd ..
done
