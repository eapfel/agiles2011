#!/bin/sh

echo "Promoviendo a producction desde el tag jenkins-agiles2011-last-${PROMOTED_NUMBER}"

cd ..

if [ ! -d jenkins-agiles2011-last-${PROMOTED_NUMBER} ];
then
git clone git@github.com:eapfel/agiles2011.git jenkins-agiles2011-last-${PROMOTED_NUMBER}
fi

cd jenkins-agiles2011-last-${PROMOTED_NUMBER}

if [ -z `git remote | grep heroku-prod` ];
then
echo "Agregando heroku remote"
git remote add heroku-prod git@heroku.com:agiles2011.git
fi

heroku maintenance:on --app agiles2011

git push heroku-prod master:master

heroku maintenance:off --app agiles2011