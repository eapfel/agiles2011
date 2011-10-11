#!/bin/sh

echo "Promoviendo a producction desde el tag jenkins-${JOB_NAME}-${PROMOTED_NUMBER}"

cd ..

if [ ! -d jenkins-agiles2011-${PROMOTED_NUMBER} ];
then
git clone git@github.com:eapfel/agiles2011.git jenkins-${JOB_NAME}-${PROMOTED_NUMBER}
fi

cd jenkins-${JOB_NAME}-${PROMOTED_NUMBER}

if [ -z `git remote | grep heroku-prod` ];
then
git remote add heroku-prod git@heroku.com:agiles2011.git
fi

heroku maintenance:on --app agiles2011

git push heroku-prod master

heroku maintenance:off --app agiles2011