#!/usr/bin/env bash
set -exo pipefail

REPO_LINK="https://$PAT_TOKEN@github.com/$REPO.git"

date="$(date +'%A %B %d')"

git clone "$REPO_LINK" -b "$BRANCH_NAME" auto-commit

pushd auto-commit

cat << EOF > README.md 
# Auto commit
## Today is $date
EOF

git add README.md
git commit -m "$date"
git push -u origin "$BRANCH_NAME"

popd

rm auto-commit -rf

