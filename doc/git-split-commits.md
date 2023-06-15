# Split a single commits into multiple commits

In addition to the possibility of combining several commits into one commit, there is also the possibility of splitting a commit into several smaller commits.

Here the interactive rebase also offers us the best possibility. As before, we can select an operation for each commit in the list of commits. To split a commit we should edit the commit and mark the corresponding line with an 'e' or 'edit'.

This now ensures that the rebase stops at this commit. A reset to the previous commit now ensures that all changes to the selected commit are in the working directory as if they had just been made. Now new commits can be created with git add/commit. If the changes are now created on new commits, the rebase can be completed or continued with git rebase --continue.
