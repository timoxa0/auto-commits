#!/usr/bin/env bash

date="$(LANG=ru_RU.UTF-8 date +'%A %d %B')"

cat << EOF > README.md 
# Auto commit
## Сегодня $date
EOF

git add README.md
git commit -m "$date"
git push "https://$PAT_TOKEN@github.com/$REPO.git" -u origin "$BRANCH_NAME"

