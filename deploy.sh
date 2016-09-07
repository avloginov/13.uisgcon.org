#!/bin/bash

npm install ; verstat -e static generate
cd server
git init
git add .
git commit -m 'auto deploy'
git remote add dokku dokku@app.se7ensky.com:uisgcon
git remote add github git@github.com:sapran/12.uisgcon.org.git
git push -f dokku master
git push -f github out
rm -rf .git
cd ..