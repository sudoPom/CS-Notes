---
id: Lecture_6_Investigation_Understanding_Problems_and_Solutions
created_date: 19/10/2023
updated_date: 19/10/2023
type: note
links:
---
* **🏷️Tags** : #Requirements-Engineering-and-Software-Architecture-COMP0101 
# Investigation: Understanding Problems and Solutions

The aim of the investigation phase is to understand the world as is and identify how we want the world to be. Techniques for this phase include background reading, interviews and modelling the world as is and the world to be.

There are different types of stakeholder needs:
* **Explicit needs**: Needs that stakeholder state explicitly, often due to problems that require fixing.
* **Hidden needs**: Needs that stakeholders fail to mention because they assume everyone knows. ^4cd7c4
* **Undreamed-of needs**: Things that the stakeholders do not know about but will be helpful.

For correct investigation, you need to make sure:
* You involve the right stakeholders.
* The stakeholders are commited to helping you understand  the problems they are facing. The stakeholders must be involved.
* To make use of **Analyst skills**
	* Interpersonal skills - be seen as a partner to the stakeholders
	* Listening and observational skills
	* Abstraction skills, pick out key bits of information among potentially irrelevant points.

---
###### Difficulties of Requirements Investigation:

* **Access to Information**: People may not be available to provide the information you need to understand the context of the problem, documents may be hard to access or data may be spread out across many documents/stakeholders.
* **Conflicting Information**: Some documentation may be out of date, people may give conflicting information, etc.
* **Tacit and Hidden Knowledge**: Knowledge that is either hard to communicate or things that are not mentioned by stakeholders (similar to [[Lecture_6_Investigation_Understanding_Problems_and_Solutions#^4cd7c4|hidden needs]])
* **Power and Politics**: People may want the project to purely benefit themselves, stakeholders could be deliberately left out and people may be hostile to or distrustful/scared of management. Some may even deliberately leave out information to slow down the project if it doesn't benefit them.
* **Dealing with Change**: Needs may change overtime for various reasons (competitors, new information, organisational changes, etc).

---
###### Investigation Techniques:

* **Background Study**: Read reports and documentation on the related system to help gain information about the work environment, application domain and how the system currently works.
	* This gives you background knowledge before meeting stakeholders. Which will help save time
	* However, there may be a lot of documentation to go through and said documentation may be inconsistent with reality.
* **Data Collection**: Collect your own information from the current system through work artefacts, management data, performance metrics, etc.
	* Data collection helps identify relevant entities, attributes and relationships and can help find quality requirements.
	* Data can be hard to interpret and good representative sample data may be hard to find.
* **Interviews**: An interview is the discussion with a stakeholder to find out more information about needs, context, requirements, etc. In social sciences interviews are used to collect information for qualitative research studies. 
	The interview process involves **preparation** (picking out interviewees, prepare questions and send an agenda out to interviewees on what will be covered), **conduction** (Explain the purpose of the interview, take notes and draw models (with the help of the interviewee), ask follow ups, and repeat and summarise to ensure you understand what they have said) and **follow up** (Ask for clarification for anything you may have misunderstood and, of course, say thank you 🤠)
	* Gives information that you cannot find in documentation, able to ask specific questions and good for finding opinions
	* However interviews may be difficult to conduct due to low availability. The amount of information you can get from a single interviewee is likely to be limited so is only useful when many interviews are conducted. And there is likely to be conflicting information.
* **Workshops**: A meeting with selected stakeholders and a workshop facilitator which is for the creation of specific deliverables in the requirements engineering process.
	![[Pasted image 20231019104639.png]]
	* Allows the collection of information from multiple perspectives. Not discussed in bits and pieces like in interviews, reveals conflicts in information and promotes a mutual understanding between stakeholders.
	* Requires a skilled facilitator, the right stakeholders need to be present and certain power dynamics may get in the way,
* **Prototyping**: A VERY quick mock up of a potential solution. There are throw away prototypes which are thrown away and evolution prototypes which are meant to be built upon.
	* Helps provide tacit knowledge and for engaging stakeholders.
	* Non functional properties are ignored and can set stakeholders expectations too high.
* **Observation**: Spend time with subjects to gain information. Can either be passive or active.
	* Can help reveal tacit information and helps gain a better understanding of the situation
	* May be hard to spot critical details. people may behave differently when observed.
* **Surveys & Questionnaires**
	* Quickly gain information from a large number of people, can be done remotely and allows the collection of attitudes, beliefs, etc.
	* Some people may not respond, and it is hard to get contextual answers from surveys. Also need to be careful of biases, ambiguous questions and the sample size being too small to be representative.
* **Analysing User Feedback**: Collect feedback from different channels.
	* This method is pretty cheap/easy to collect - provided there are feedback channels.
	* May be hard to extract useful information from reviews, there may be conflicting reviews. 

# Questions / Thoughts