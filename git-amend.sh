# Create a new directory for the repository (if not exists) and move into it
mkdir -p git-amend

cd git-amend

#clean up complety the directory (all (hidden) files and folders)
rm -Rf *
rm -Rf .*

# Initialize a new Git repository
git init

# Create a few files and make some commits

# File 1
echo "This is a simple project to demonstrate Git commands" > README.md
git add README.md
git commit -m "Add README"

# File 2
echo "print('Hello, wörld!')" > hello.py
git add hello.py
git commit -m "Add hello script"

echo "print('Hello, world!')" > hello.py

cd -