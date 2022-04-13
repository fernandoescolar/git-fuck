#!/bin/sh
cd "$(git --exec-path)"
cat << EOT >> git-fuck
#!/bin/bash
if [ "\$1" == "off" ]
then
  if [ -z \$2 ]
  then
    git reset HEAD~1
  else
    git reset HEAD~\$2
  fi 
  exit 0
fi
if [ "\$1" == "it" ]
then
  git add .
fi
git commit -a -m "\$(curl -s http://whatthecommit.com/index.txt)"
if [ "\$1" == "up" -o "\$2" == "up" ]
then
  git push
fi
EOT
chmod +x git-fuck
