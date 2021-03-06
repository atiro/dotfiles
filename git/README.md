Remote
======

List remotes

	git branch --remotes

Add remote

	git remote add [remote name] [URL]

List fetch/push

	git remote --verbose

Upload branch and set upstream repo 
	git push --set-upstream [remote] [branch]

Delete remote branch

	git push --delete [remote] [branch]

Tagging
=======

Add a tag to a commit

	git tag [tag] [commit]


Undoing
=======

Discard unstaged/committed changes to a file

	git checkout -- [filename]

Restore staged changes to a file

	git reset --hard -- [filename]

Discard all unsaved changes (staged, not committed) in working directory

	git reset --hard

Combine commits up to but not including a specific commit

	git reset [commit]

Remove all unsaved changes, includinhg untracked files

	git clean -fd

Remove all staged changes and prev commited work upto a commit, do not remove
new files from working directory

	git reset --hard [commit]

Remove previous work, but keep the commit history intact

	git revert [commit]

Remove a single commit from a branch's history OR keep previous work but
combine with another commit

	git rebase --interactive [commit]



Merging
=======

Merge branch back into master and squash all commits into one

	git checkout master
	git merge [branch] --squash
	git commit
	git branch --delete [branch]

Undo merge (immediately after incorrect merge)

	git reset --merge ORIG_HEAD

Undo merge, picking some commits (immediately after incorrect merge)

	git checkout -b [preservation branch]
	git checkout master
	git reset --merge ORIG_HEAD
	git cherry-pick

Undo merge (after further commits)

	git checkout -b [preservation branch]
	git checkout master
	git reset [last correct commit]
	git cherry-pick


Reversing a merge commit

	git checkout [branch]
	git log --graph --oneline
	git revert --mainline 1 [commit]


Deleting
========

Delete an unmerged branch

	git branch -D [name]

Rebasing (updating branch from master)
========

	git checkout master
	git pull --rebase=preserve [remote] master
	git checkout [branch]
	git rebase master

If conflicts

	git mergetool [filename]
	# Resolve the merge conflict
	git rebase --continue

If modified file deleted on master

	git reset HEAD [filename]
	git add [filename]

	git rebase --interactive
	git rebase --continue

If all goes wrong

	git rebase --abort

Rebasing (squashing commits)
========

To squash/pick commits

	git rebase --interactive [commit]

Commits from [commit] presented in oldest -> newest. Pick commit and squash
following to merge into one. Update the commit message

Rebasing (splitting commit)
========

	git rebase --interactive [commit]

Change commit to be split from pick to edit

	git reset HEAD~1

	git add --patch [filename]
	git commit
	git rebase --continue





Logging
=======

List all commits

	git log

List local repo commits

	git reflog

Cherry Picking
==============

Pick commit and including cherry-pick line in commit log
	git cherry-pick -x [commit]

Commits
=======

Amend last commit

	git all [file] [file] [...]
	git commit --amend

If just changing last commit message

	git commit --amend

Merge last few commits into one

	git reset [commit] OR git reset HEAD~3
	git add --all
	git commit -m "Replacing commits upto [commit] with single new commit"


Reverting 
=========

If you want to revert (remove) a commit but leave the commit logged

	git revert [commit]


Branches
========

Search for branches with a commit

	git branch --contains [commit]

Logs/Diff
====

	git log [branch]

Show diffs
	git log --patch  [branch]
	git diff master [branch]

Simple stats diff

	git diff master --stat

Search for log message matching string

	git log -S [string]

	git log -G [regex]

Blame
=====

See who edited the file

Bisect
======

	git bisect start
	git bisect good [commit]
	git bisect bad [commit]

Git will then set working directory to a commit. Verify if it is good or bad 
state

	git bisect bad

	git bisect good

When you have found the commit that breaks the code (note the commit id)

	git bisect reset
	git blame [filename]
Stashing
========

Save working directory (only commited files)

	git stash

Save working directory (including untracked files)

	git stash --include-untracked

Save commited and throw away untracked

	git stash 
	git clean -d

List stashes

	git stash list

View stash

	git show stash@{0}

Named stash

	git stash save "quick description"

Apply stash

	git stash apply stash@{0}

Delete stash

	git stash drop stash{0}

Apply & delete

	git stash pop stash@{0}
