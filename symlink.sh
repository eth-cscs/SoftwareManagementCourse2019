# hook paths are evaluated from the .git/hooks dir, so add ../../

chmod +x git/hooks/pre-commit

ln -s -f ../../git/hooks/pre-commit .git/hooks/pre-commit
