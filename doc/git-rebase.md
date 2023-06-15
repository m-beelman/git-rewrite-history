# git interactive rebase

When you do `git rebase -i <base>`, Git shows you a list of all commits that are in your current branch but not in the `<base>` branch. Each line represents a commit.

Here is what the commands in interactive rebase do:

`pick`: Use this commit as is. It's the default action for all commits.

`reword`: Use this commit but let me change the commit message.

`edit`: Use this commit but let me change the commit content. This will pause the rebase process and let you amend the commit.

`squash`: Combine this commit with the one before it. You will be able to write a new commit message for the new combined commit.

`fixup`: Same as squash, but discard this commit's message.

`drop`: Don't include this commit at all.

After you select the actions for all commits, Git will start doing what you asked for, one by one. If a step requires your attention (like writing a commit message or editing a commit), Git will pause and let you do it. When you're done, you can continue the rebase with `git rebase --continue`. If you want to stop the rebase, you can use `git rebase --abort`.

Interactive rebase is really useful when you want to clean up your work before sharing it with others. It's like a magic time machine! But be careful, because changing history can be dangerous if you're working with others.
