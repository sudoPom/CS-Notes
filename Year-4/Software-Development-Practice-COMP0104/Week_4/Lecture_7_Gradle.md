---
id: Lecture_7_Gradle
created_date: 24/10/2023
updated_date: 24/10/2023
type: note
links: 
---
* **🏷️Tags** : #Software-Development-Practice-COMP0104 
# Gradle

Gradle is a build system that makes use of "best practices", plugins like [[Lecutre_6_Maven|maven]] but unlike maven, allows the use of build scripts like [[Lecture_4_Build_Systems_and_Make#Make|make]] does through the use of a domain specific language.

The buildfile is a lot easier to read as it's not written in XML. The concept of tasks are used in gradle, where the output of a task is saved, if the output of a task changes, all dependant tasks are executed. Gradle also handles dependency management and uses repositories for external dependencies.

The Gradle buildfile is written using Groovy syntax:

```groovy

defaultTasks "goodbyeWorld" // Will try to execute the goodbye
                            // world task first.

task helloWorld{
	doLast{
		println "Hello world"
	}
}

task goodbyeWorld (dependsOn:helloWorld){ // State dependency on 
	doLast{                               // helloWorldTask
		println "Goodbye world"
	}
}
```

Importing a plugin can be done as follows:

```groovy
apply plugin : "plugin-name"
```


# Questions / Thoughts