echo "Running pull request build on Travis"
repo_url=$(git config --get remote.origin.url)
latestPRCommit=(${TRAVIS_COMMIT_RANGE//\.\.\./ })
latestPRCommit=${latestPRCommit[1]}
git clone ${repo_url} ${latestPRCommit}
cd ${latestPRCommit}
SOURCE_BRANCH=($(git branch -r --contains ${latestPRCommit}))
export SOURCE_BRANCH=${SOURCE_BRANCH/origin\//}
cd -