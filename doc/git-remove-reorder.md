# Remove or Reorder Commits

Removing and reordering the commits can be done very easily by an interactive rebase. These operations are very simple, because it is based only on line shifts or deleting lines. As mentioned earlier, the rebase is essentially a list of instructions on what to do with each commit.

If now in this list of instructions lines are exchanged then this corresponds also to an exchange of the Commits in the new history. If a line is removed from the list the appropriate Commit for the pending Rebase is not considered any longer and is considered thus as removed.