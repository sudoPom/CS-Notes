---
id: Lecture_2_Version_Control
created_date: 09/10/2023
updated_date: 09/10/2023
type: note
links:
  - "[[Lecture_1_Identifying_Changes]]"
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Version Control

Version control is used by developers to coordinate changes made to a code base. These changes can either be **revisions**, which are changes that are made to replace the older version of the code base or **variants**, which are changes that are meant to be used alongside the the original version. 

Version Control Systems store one copy of the code base on a remote repository, developers can **checkout** code from the repository and make edits locally. Private changes can then be commited  to the remote repository, which are then visible to other developers who can update their local copy of the remote code base.

Access may be **pessimistic**, files being edited are locked so only one developer can work on it at a time, or **optimistic** concurrent modification of files is allowed and changes made to the same file are [[Lecture_1_Identifying_Changes#Integration|merged together]].

### Subversion

Subversion is an old version control tool. A subversion repository will often store multiple different projects that can be checked out individually. Each project is a sub-directory in the repository's file system tree.

Subversion commits replaces the old revision with the new one and updates the repository.

The subversion `update` command retrieves all the commits made since the last `checkout` or `update` command.

Commits need to be atomic so the repo is not left in a broken state.

In subversion each commit creates a new revision, identified as a natural number 1 greater than the previous revision, starting from zero. 

##### File States

A file's state has two parts, local and remote. The local part is changed or unchanged, and the remote part is current (up to date with remote repository) or out of date.

If a file is both locally changed and out of date with respect to remote the `svn remote` command will fail. `svn update` will need to be carried out first, which will attempt to automatically merge the remote changes with your local ones.

### Branches and Tags

A **branch** allows developers to create a variant of the repository, which will eventually be merged into the main branch, or the trunk. 

A **tag** acts as a snapshot of the repository which can be restored at a later date. For example you may keep a tag for different versions (v1.2) of the code base.

Development can use different branching methodologies:
* Unstable trunk: All changes are commited directly to trunk.
* Stable trunk: All/most changes are made on branches which are then merged into trunk.

#### Use for Releases

Branches and tags can be used for release planning. There is a **release** branch which has different versions of the software being developed, and the trunk, where or development occurs.

A new release branch is prepared for each version, which is used for testing and bug fixes. Core development of the new version is done on the trunk.

Bug fixes can either be developed on the trunk and merged to release or developed on release and merged to trunk. If developed on release then a new commit is made on the release branch (with the fix) and is then merged into trunk. On the other hand if bugs are fixed on the trunk then certain commits may need to be **cherrypicked**  to the release branch as the bug fix may depend on a commit made during development that was made on the trunk.

**Cherrypicking** is the process of merging certain revisions from one branch to another. The revisions do not need to be sequential.  When a commit is cherry picked, the original commits are not deleted.

**Code freeze** is the process of pausing development and working only on bug fixes. This is sometimes done before and after the time of release of a new version.



 




# Questions / Thoughts

How can a file that is already in the repository be marked as "Added" Rather than "Unknown"? 

![[Pasted image 20231009161438.png]]