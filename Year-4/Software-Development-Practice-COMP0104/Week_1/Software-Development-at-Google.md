
## Source Repository

Google stores most of its code in a single source-code repo, accessible to every engineer that works there. The exceptions are the two open source and high security projects. Writes to this large repository has write restrictions - only owners of a sub-tree in the repository directory can approve changes.

All development occurs at the "head" of the repository - not on branches.

Automated systems run frequently - after any changes in the dependencies of the test. 

Each sub-tree of the repository is owned by two users and sub-directories inherit the owners of its parent. Each sub-tree has at least two owners which control write access. 

## The Build System

Google's build system is called blaze and is responsible for compiling and linking the source files of a given project.

BUILD files are used to describe how a build should be carried out. Build entities like libraries, programs and tests are defined with high level build specifications. Some build files can automatically be generated. Regardless of how they are created, they are always checked into the repository. Each build is distributed across many (possibly thousands) of machines.

Individual builds must be "hermetic" meaning they only depend on their declared inputs. As a consequence, build steps are deterministic. 

The results of a build can be cached due to their deterministic nature, allowing for repeated builds to be carried out quickly even across different engineers.

Build checks are ran automatically during code review.

## Code Review

Google's code review software has email integration which directly links to the review in question. Reviewers are automatically suggested when created a code review but the author can request anyone to review. 

At least one other engineer must review the code, except in exception circumstances in which the code can be merged to head and reviewed later.

Changes are encouraged to be relatively small as larger changes are often too "rigid" and resist reviewer suggested changes.

## Testing

All code that is written is expected to be unit tested. There are automatic tools that determine the coverage of tests.


