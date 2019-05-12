mkdir git_test
cd git_test
git init .
du -ch .
for l in {1..8192} ; do printf 'x%.0s' {1..128}; printf "\n"; done > x.txt
git st
git add x.txt
git st
git commit -m"New file containing only x's"
git log
du -ch .
