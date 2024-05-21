---
id: Lecture_15_Code_review
created_date: 27/11/2023
updated_date: 27/11/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Code Review

Code review is the asynchronous or synchronous peer review of source code in order to:
* Find and fix bugs early
* Give timely feedback to the author
* Share knowledge
* Enforce collective code ownership
* Mentoring new starters

Email pass around reviews involves the author sending out all files to the reviewers, who will then send back their responses. This has the issue of the tracking of different threads being difficult.

Pair programming is the process of having a second programmer look over the shoulder of the first programmer and suggest changes. Pair programmer does not have clear separation, lacks documentation of the changes made (as it is all oral) and the second programmer is typically too involved in the code.

###### Review Life cycle
![[Pasted image 20231127142956.png]]

**Pessimistic Reviews** involve only commiting reviews after they have been reviewed, whilst **Optimistic Reviews** involves reviewing artefacts after they have been commited, possibly causing the review to never be carried out.

Typically development is done by creating a new branch per feature. Whenever a branch is ready to be merged/rebased back into the main branch, a **pull request** is generated.

Gerrit is a code collaboration tool used for reviewing code. There are three roles in Gerrit:
* Contributor: Uploads a change and does not have permission to commit code.
* Reviewer: Can comment on a change and can score a change.
* Commiter: Has the final word on a change.

Commits are mapped to reviews via change-Ids. A review consists of multiple commits, and commits are automatically given change-Ids. A commit without a change Id cannot be reviewed.

Every team member can provide a score for a commit:
* Reviewers can provide scores -1, 0 and 1.
* Commiters can provide scores -2 and 2.
A score of +2 commits the change to the branch, while a score of -2 vetos the change. Scoring is not cumulative. Scores also mean different things depending on whether the commit is being reviewed or verified.

| Code Review | -2  | Veto, code cannot be accepted in any case |
| ----------- | --- | ----------------------------------------- |
|             | -1  | Code looks good but changes are needed    |
|             | +1  | Code looks good but need more reviewers   |
|             | + 2 | Code looks good and can be merged         |
| Verified    | -1  | Code does not work                        |
|             | -2  | Code works fine                           |



# Questions / Thoughts