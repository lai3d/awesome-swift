#!/bin/bash

set -e

if [[ $TRAVIS_BRANCH != 'master' ]]
then
  exit
fi

git checkout master

git config user.name "CI"
git config user.email "dkhamsing@users.noreply.github.com"

status=`git status`

if [[ $status == *"README.md"* ]]
then
  git add README.md
  git commit -m "[auto] [ci skip] Generate README"
  git push --quiet "https://${GH_TOKEN}@github.com/matteocrippa/awesome-swift" > /dev/null 2>&1
fi
