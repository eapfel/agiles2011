#!/bin/sh

echo "Promoviendo a producction desde el tag jenkins-agiles2011-${PROMOTED_NUMBER}"

cd ..

git clone git@github.com:eapfel/agiles2011.git jenkins-agiles2011-${PROMOTED_NUMBER}

cd jenkins-agiles2011-${PROMOTED_NUMBER}

if [ -z `git remote | grep heroku-prod` ]
then
git remote add heroku-prod git@heroku.com:agiles2011.git
fi

git push heroku-prod master