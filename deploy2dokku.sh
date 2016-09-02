#!/bin/bash

npm install ; verstat -e static generate
cd server
git init
git add -A
git commit -m 'auto deploy2dokku'
git remote add dokku dokku@app.se7ensky.com:uisgcon
git push -f dokku master
rm -rf .git
cd ..