#!/bin/sh

echo "Promoviendo a staging"

if [ -z `git remote | grep heroku-staging` ]
then
git remote add heroku-staging git@heroku.com:agiles2011.git
fi
heroku maintenance:on --app agiles2011-staging

git push heroku-staging jenkins:master
git push --tag

heroku maintenance:off --app agiles2011-staging