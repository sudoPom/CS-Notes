---
id: Lecture_5_Another_Neat_Tool
created_date: 23/10/2023
updated_date: 23/10/2023
type: note
links:
  - "[[Lecture_4_Build_Systems_and_Make]]"
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Another Neat Tool (ANT)

ANT is a build tool where the user specifies tasks to create a specific target, rather than using commands like [[Lecture_4_Build_Systems_and_Make|MAKE]] does. Each task knows which tools and commands are used to realised the target. Ant comes with hundreds of predefined tasks - fine grained dependencies are not used here.

#### Buildfiles

ANTs make file is called a **Buildfile** which has exactly one project. Each project has a name and a default target. Each project can have multiple targets. Every target has a name and optional dependencies. The dependencies list targets that must have been constructed before the target of the current task. A target is constructed after a number of tasks are executed.

Buildfiles are written in XML:

```xml
<project name="SimpleProject" default="dist">
	<target name="compile"> 
		<mkdir dir="classes"/>
		<javac srcdir="." destdir="classes"/>
	</target>
	<target name="dist" depends="compile">
		<mkdir dir="lib"/>
		<jar jarfile="lib/simple.jar" basedir="classes"/>
	</target>
	<target name="clean">
		<delete dir="classes"/>
		<delete dir="lib"/>
	</target>
</project>
```

Targets are ALWAYS invoked. The tasks are responsible for checking if they actually need to be re ran.

Buildfiles also have variables called **properties**:

```xml
<project name="SimpleProject" default="dist">
	<property name="dist" value="lib"/>
	<target name="compile">
		<mkdir dir="classes"/>
		<javac srcdir="." destdir="classes"/>
	</target>
	<target name="dist" depends="compile">
		<mkdir dir="${dist}"/>
		<jar jarfile="${dist}/simple.jar"/>
	</target>
	<target name="clean">
		<delete dir="classes"/>
		<delete dir="${dist}"/>
	</target>
</project>
```

ANT has a java class `Task` which can be subclassed to create a new task. Existing tasks can be subclassed to make variations.
# Questions / Thoughts