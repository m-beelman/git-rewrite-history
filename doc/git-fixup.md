# Add changes to a commit in the middle of the branch history

Similar to the amend, we often find ourselves in the situation of wanting to extend a commit. With the amend we can always refer to the last commit, but what if the commit we want to extend is placed in the middle of our branch history?

For this, git also provides us with a way to address a commit that we want to extend.

This is done by making the change and then using `git add` to add the file to the staging area and then create the commit. We use the option `--fixup` with the hash commit to which the FixUp should refer.

Afterwards with an interactive rebase and the option `--autosquash` the extension of the actual commit is made. The interactive rebase activated by `-i` runs as before but the fix-up commit is now already directly in the correct order of the commits.

```bash
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ cat hello.py 
# print 'Hello, wörld' to the console
print('Hello, world!')
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ vim hello.py 
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ cat hello.py 
# print 'Hello, world' to the console
print('Hello, world!')
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ git log
commit 18b6262a78d489e20efc485d4ae05e8b5500a319 (HEAD -> main)
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add README file

commit a43b43fc6db92449a051bc1e96e26871f2184f6a
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add comment to script

commit 0aa881b92697ba146e71d4d2f1c4020d4c1a3b93
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add hello script
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ git add hello.py 
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ git commit --fixup a43b43fc6db
[main 9d036de] fixup! Add comment to script
 1 file changed, 1 insertion(+), 1 deletion(-)
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ git log
commit 9d036dea3e504b3bd5ab508a2f0c6c7ee8209ff1 (HEAD -> main)
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:42:27 2023 +0200

    fixup! Add comment to script

commit 18b6262a78d489e20efc485d4ae05e8b5500a319
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add README file

commit a43b43fc6db92449a051bc1e96e26871f2184f6a
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add comment to script

commit 0aa881b92697ba146e71d4d2f1c4020d4c1a3b93
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add hello script
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ git rebase -i --autosquash --root
Successfully rebased and updated refs/heads/main.
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ git log
commit b7e15b949644b866f8df9ea2ad19cdfe3309aa19 (HEAD -> main)
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add README file

commit 82c1b53aa3f12c4501b9f08d41c9f56fc909fb3c
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add comment to script

commit 0aa881b92697ba146e71d4d2f1c4020d4c1a3b93
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 15:40:47 2023 +0200

    Add hello script
mbeelman@wsl:~/projects/git-history-samples/git-fixup$ 
```
