#!/bin/bash

set -e

mkdir -p emmet
cd emmet
[ -d .git ] ||  git init . 

git remote rm origin 2> /dev/null || true
git remote add origin https://github.com/emmetio/emmet

git fetch origin
git remote set-head -a origin
git reset origin/HEAD --hard

npm i 
./node_modules/.bin/gulp
cp dist/emmet-snippets.js ../emmet.js
