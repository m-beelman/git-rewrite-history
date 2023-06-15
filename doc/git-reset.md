# Squash the latest commit with git reset

Especially when many small commits are made, which is recommended, you get into this situation that you would like to combine the last n commits into one commit. Here you could also work with git rebase, but you can also use git reset in this situation.

With the git reset command I set the head of the branch to a specific (previous) commit. It is important to know that the content of the working directory is not changed by default. So all changes are in my working directory and are now different from the newly defined `HEAD`. With the `git diff` command you should find all the changes that were made between the previous and the new (reset) `HEAD`.

From now on we can work as before and e.g. combine all changes in one commit or split commits as they make sense for us.

```bash
mbeelman@wsl:~/projects/git-history-samples/git-reset$ git log
commit da80267fe58cbebe8baa20e13fb52c4538fa699b (HEAD -> main)
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:54 2023 +0200

    Add comment to script

commit cb157a9eeb512d3d04ab63f48101867a17826324
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:54 2023 +0200

    Fix typo in script

commit b10fa89231bbe13cf4dcf07b67a6134194934f9e
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:54 2023 +0200

    Add hello script

commit 427c9cba4d32e07a2d169b6d34b1f5936dfa4fb1
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:54 2023 +0200

    Add README
mbeelman@wsl:~/projects/git-history-samples/git-reset$ git reset 427c9cba4
mbeelman@wsl:~/projects/git-history-samples/git-reset$ git status
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        hello.py

nothing added to commit but untracked files present (use "git add" to track)
mbeelman@wsl:~/projects/git-history-samples/git-reset$ git add hello.py 
mbeelman@wsl:~/projects/git-history-samples/git-reset$ git commit -m "Add hello script"
[main 432e513] Add hello script
 1 file changed, 2 insertions(+)
 create mode 100644 hello.py
mbeelman@wsl:~/projects/git-history-samples/git-reset$ git log
commit 432e51335e12e2725eae39aa449dc9d8fe740140 (HEAD -> main)
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 09:23:22 2023 +0200

    Add hello script

commit 427c9cba4d32e07a2d169b6d34b1f5936dfa4fb1
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:54 2023 +0200

    Add README
```
