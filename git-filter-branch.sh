# Create a new directory for the repository (if not exists) and move into it
mkdir -p git-filter-branch

cd git-filter-branch

#clean up complety the directory (all (hidden) files and folders)
rm -rf *
rm -rf .*


# Initialize a new Git repository
git init

# Create a few files and make some commits



# File 2
echo "print('Hello, wörld!')" > hello.py
echo -e "# Instead of this command the file could contain credentials or other secrets\n# that should not be store in a repo\ngit filter-branch --force --index-filter 'git rm --cached --ignore-unmatch filter-branch.sh' --prune-empty --tag-name-filter cat -- --all" > filter-branch.sh
git add filter-branch.sh
git add hello.py
git commit -m "Add hello script"
git tag -a v1.0 -m "Version 1.0"

echo "print('Hello, world!')" > hello.py
git add hello.py
git commit -m "Fix typo in script"
git tag -a v2.0 -m "Version 2.0"

echo -e "# print 'Hello, world'to the console\nprint('Hello, world')" > hello.py
git add hello.py
echo "This is a simple project to demonstrate Git commands" > README.md
git add README.md
git commit -m "Add README file and a comment to the script"
git tag -a v3.0 -m "Version 3.0"

cd -