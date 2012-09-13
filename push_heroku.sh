#! /bin/sh

# For octopress/heroku: generate site, deploy, and tag as "deploy-yyyy-mm-dd"

# This allows you to keep your public/ assets out of git,
# and only add them just before deploying

BRANCH=`git symbolic-ref -q HEAD | sed 's/refs\/heads\///'`
SHA=`git rev-parse --short HEAD`

echo 'deploying branch:'
echo $BRANCH

# in case we killed this script previously
git branch -D deploy

# (you could also git stash here)
git checkout -b deploy

# build all the things
rake generate

# add generated stuff (force because it's .gitignored)
git add -f public

# commit and tag
git commit -m "generate site for heroku deployment"
git tag -f deploy-`date +"%Y-%m-%d"`-$SHA

#restore initial state
# (you could also git stash apply here, etc.)
git checkout $BRANCH
git push  -f heroku deploy:master
git branch -D deploy
