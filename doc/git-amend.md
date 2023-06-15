# Amending the last commit

It often happens that after the last commit there is a change that should have been in the last commit. Here it makes sense to extend the last commit by this change. With `git --amend` we can do exactly that. In the example we see that a local change (indicated by git diff) is added to the last commit.

The `--no-comment` option ensures that we simply take over the existing comment and do not want to create a new one. By default the editor would start and ask for a comment. But also here the already existing comment is shown as a suggestion.

```bash
mbeelman@wsl:~/projects/git-history-samples/git-amend$ git log
commit 198ccbd7104cc8869671746524df59344303eab2 (HEAD -> main)
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:53 2023 +0200

    Add hello script

commit 866eb1c94dbafa4800b68c5b56165ff28b453623
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:53 2023 +0200

    Add README
mbeelman@wsl:~/projects/git-history-samples/git-amend$ git diff
diff --git a/hello.py b/hello.py
index 2592662..ec7780c 100644
--- a/hello.py
+++ b/hello.py
@@ -1 +1 @@
-print('Hello, wörld!')
+print('Hello, world!')
mbeelman@wsl:~/projects/git-history-samples/git-amend$ git commit --amend --no-edit
[main 7ebdcd2] Add hello script
 Date: Mon Jul 3 08:13:53 2023 +0200
 1 file changed, 1 insertion(+)
 create mode 100644 hello.py
mbeelman@wsl:~/projects/git-history-samples/git-amend$ git log
commit 7ebdcd2c79b214f5caec1181f61707b9069e2c25 (HEAD -> main)
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:53 2023 +0200

    Add hello script

commit 866eb1c94dbafa4800b68c5b56165ff28b453623
Author: Beelmann, Marko <marko.beelmann@philips.com>
Date:   Mon Jul 3 08:13:53 2023 +0200

    Add README
```

If we compare the two outputs of `git log`, we can see that the SHA-1 checksums have changed.
