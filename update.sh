#!/usr/bin/env bash

REPO_LINK="https://$PAT_TOKEN@github.com/$REPO.git"

date="$(LANG=ru_RU.UTF-8 date +'%A %d %B')"

git clone "$REPO_LINK" auto-commit

pushd auto-commit

cat << EOF > README.md 
# Auto commit
## Сегодня $date
EOF

git add README.md
git commit -m "$date"
git push "$REPO_LINK" -u origin "$BRANCH_NAME"

popd

