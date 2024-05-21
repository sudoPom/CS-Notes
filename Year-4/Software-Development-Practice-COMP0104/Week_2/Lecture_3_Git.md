---
id: Untitled
created_date: 10/10/2023
updated_date: 10/10/2023
type: note
links:
  - "[[Lecture_2_Version_Control]]"
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Git

Git is a [[Lecture_2_Version_Control|version control system]] that makes use of multiple distributed repositories. The entire history of your local repository is accessible locally. Changes made to your repository can be pushed to any other repository. Git makes use of a **staging** area which allows users to prepare a commit. Once a commit is made these changes are reflected into your own local repository. Changes in your local repository can then be merged to the remote repository.

This means that you can treat the remote repo as a "backup" and can technically make use of version control features locally.

#### File Status Life Cycle

![[Pasted image 20231010162903.png]]

Git supports [[Lecture_2_Version_Control#Branches and Tags|branching]] which allows the creation of a temporary repository. Work can be done on this branch without affecting the main trunk until it is merged in.

```
git branch <branch name> # Creates a new branch
git checkout <branch name> # Switch to another branch
```

### Merging

Typically a branch is created when adding a new feature to the  product. Testing can be done on the branch and when the feature is ready it can be merged back into the main branch.

```
git merge <other-branch> # Merges the other branch into the current branch
```

Merging can be done using fast-forward when there have been no changes made to the current branch. This essentially just moves the pointer of the branch to where the other branch's pointer is on the commit tree.

The alternative is to use a [[Lecture_1_Identifying_Changes#^cd5545|three way merge]] with the base commit being the common ancestor of the two branches.

##### Rebasing

Rebasing involves applying the commits on the current branch to the head of the target branch.

### Git Internals

Older VCS used **delta storage**. The initial commit of a file would be stored and rather than storing the entire file each time its changed, only the changes were stored. To retrieve some change $n$ you'd need to go back to the initial version of the file then apply all the $n$ changes. Subversion does the opposite of this, by storing the entirety of the newest file and storing the deltas of prior versions of the file.

Newer VCS like git make use of **DAG storage** which stores a snapshot of most of the repository after every single change. This is possible due to the cheaper disk prices. Git does not store differences. The snapshot of the repository is stored using [[Lecture_3_Git#Git Objects|git objects]].

#### Git Objects

There are four git objects, Blobs, Trees, Commits and Tags.

* **Blob**: The smallest unit of git. Blobs contain the content of a file and can be referenced by the hash of the content. Blobs are immutable.
* **Tree**: Contains a list of blobs and trees. They are essentially directories which point to the files (blobs) and sub directories (trees). Trees are also blobs and has a hash which is based on the contents.
* **Commit** references a tree and contains information about the commit such as the author, message and date. Commits are also blobs.
* **Tag** a reference to a commit. Tags are files that contain the hash of the commit. A commit can have any number of tags.

Files that are not modified in a given change will have the exact same hash as when it's was last changed. This means that the file is not duplicated.f

# Questions / Thoughts