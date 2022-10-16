# Git, Github and Modifying CW

## Git(hub)

### Useful git commands

* `git status`  - Lists all files modified and untracked files
* `git add -u`  - Stages all modified files
* `git add .` - Stages all files
* `git checkout -b <name>` - Creates a new branch with the name 'name' 

### Branches 

Branches allow creating a seperate workflow seperate from the main branch to add new features to a project. Once developed the branch can be merged with the master branch, combining all changes made to the master and the newly created branch. 

A new branch should be created whenever new functionality is being developed. Usually a branch is created for a new issue defined on github. Once the feature is developed on the new branch, a pull request is created to merge the branch to another branch (normally master).  Pull requests are discussion threads that allow teams to determine whether the changes actually solves the relevant issue. Once merged the relevant issue is closed.

Rules can be added to branches. For example: `Pushing to master must make use of a pull request with 2 approvals` is a rule. 

### Untracked Files

Files that aren't in the repository, only files needed to run the project should be in the repository. The `.gitignore` file includes the names of all files to be ignored when staging files. 

## Modifying Coursework

### Python commands

`nosetests test <path to unit tests>` -runs all tests 

(Just check the scripts)

### Dynamic Dispatch

Rather than having a large switch case / elif statement, you can make use of Classes and an Interface. Each command could be represented as a class implementing a command interface, which has an `execute` method. Each command class can then have a unique body for the `execute`  method. This way, rather than checking the type of the command with an if else, the `execute` method can be ran on any command given, in it's unique way defined in it's class. Rather than using an interface a superclass can also be used. 





 