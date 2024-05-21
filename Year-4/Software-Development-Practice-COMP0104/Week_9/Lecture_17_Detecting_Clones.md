---
id: Lecture_17_Detecting_Clones
created_date: 04/12/2023
updated_date: 04/12/2023
type: note
links:
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Detecting Clones

**Clones** are segments of code that are similar. Similarity can be in terms of text, semantics, syntax, patterns, etc. There are 4 classes of clones:
* Type 1: Completely identical source code, no changes at all.
* Type 2: Exactly identical source code clone but with indentation, identifier name or comment changes.
* Type 3: Functionally identical clone but with small changes made to tailor it to a new function.
* Type 4: A functionally identical clone.

There are different cloning methods. Forking, Templating and Customisation.

Cloning has some consequences. Whenever a fix needs to be made in a clone, it needs to be made to all clones, which can take a while.

Clones can be detected using tools like [[Lecture_1_Identifying_Changes#Diff Algorithm|diff]] to compare the text. The syntax tree or the tokens of the program can be compared. 

# Questions / Thoughts