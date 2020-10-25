Assignment 7 Jenkins

Assignment1:
      1. Create 2 slave and connect them to jenkins master.
  Steps:	
 Create ssh connection between master and slave machines.
 Add the ssh credentials in confiuration and check ssh connection.
 Go to Manage Jenkins.
 Click on Manage nodes.
 Create new nodes.
 Provide Node Name and select Permanent agent.
 Then provide name, description, no. of executors, labels, remote root directory.
 Select Launch method via ssh.
 Provide host name and credentials & click save.
 Go to the nodes and click launch node.
 Now the nodes are being started.
(Similarly we can multiple nodes which act as slave for master server)

![master slave setup](https://github.com/tarungoel1995/assignments/blob/master/AWS/day8/media/snapshotsofami.png)






2. Restrict jobs for a specific jenkins slave.
Steps:
Click on any particular job which you want to restrict for a specific jenkins slave and go in configure job section. 
Click on the checkbox for “Restrict where this project can be run” in General section.
Give the name of slave in the box of Label expression.
Click on save and build now 
In Console Output you can see that your job is being built on Specfic slave which you selected.

![Slave 2 restrict](https://github.com/tarungoel1995/assignments/blob/master/media/slave2restrict.png)


![Vagrant restrict](https://github.com/tarungoel1995/assignments/blob/master/media/vagrantrestrcit.png)



3. Create a job that can run on either salve(any of the two).
Go to manage jenins and manage nodes.
Click on nodes and configure them 
In Labels section enter ‘Multiple’ for both nodes and save them.
Now select any job and in configuration, general section,  Click on the checkbox for “Restrict where this project can be run” in General section.
Give ‘Multiple’ in the box of Label Expression.
Save and build the job.
(Job will run on either of slaves )


![MultiNode](https://github.com/tarungoel1995/assignments/blob/master/media/multiplenode.png)








     Assignmnet2:  Use jenkins rest api to
1. Get the list of all jobs
Command:
```
curl -u tarungoel1995:11d5e1c07cb82e34b45bf909e21f0403 http://192.168.33.10:8080/api/json?pretty=true
```

Output:-
{
  "_class" : "hudson.model.Hudson",
  "assignedLabels" : [
    {
      "name" : "idle"
    },
    {
      "name" : "master"
    }
  ],
  "mode" : "NORMAL",
  "nodeDescription" : "the master Jenkins node",
  "nodeName" : "",
  "numExecutors" : 2,
  "description" : null,
  "jobs" : [
    {
      "_class" : "hudson.maven.MavenModuleSet",
      "name" : "CICD",
      "url" : "http://192.168.33.10:8080/job/CICD/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "clonejenkins",
      "url" : "http://192.168.33.10:8080/job/clonejenkins/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.maven.MavenModuleSet",
      "name" : "codeanalysis",
      "url" : "http://192.168.33.10:8080/job/codeanalysis/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.maven.MavenModuleSet",
      "name" : "codecoverage",
      "url" : "http://192.168.33.10:8080/job/codecoverage/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "codestability",
      "url" : "http://192.168.33.10:8080/job/codestability/",
      "color" : "aborted"
    },
    {
      "_class" : "hudson.maven.MavenModuleSet",
      "name" : "codestabilityday3",
      "url" : "http://192.168.33.10:8080/job/codestabilityday3/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.maven.MavenModuleSet",
      "name" : "codestabilty2",
      "url" : "http://192.168.33.10:8080/job/codestabilty2/",
      "color" : "blue"
    },
    {
      "_class" : "org.jenkinsci.plugins.workflow.job.WorkflowJob",
      "name" : "descriptive",
      "url" : "http://192.168.33.10:8080/job/descriptive/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "devproject",
      "url" : "http://192.168.33.10:8080/job/devproject/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "directorytask",
      "url" : "http://192.168.33.10:8080/job/directorytask/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "DOWNSTREAM",
      "url" : "http://192.168.33.10:8080/job/DOWNSTREAM/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "GIT CLONE",
      "url" : "http://192.168.33.10:8080/job/GIT%20CLONE/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "Hello Person",
      "url" : "http://192.168.33.10:8080/job/Hello%20Person/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "Hello World",
      "url" : "http://192.168.33.10:8080/job/Hello%20World/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "helloworld",
      "url" : "http://192.168.33.10:8080/job/helloworld/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "Nested View",
      "url" : "http://192.168.33.10:8080/job/Nested%20View/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "PERIODICAL",
      "url" : "http://192.168.33.10:8080/job/PERIODICAL/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "POLLSCM",
      "url" : "http://192.168.33.10:8080/job/POLLSCM/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "seedjob1",
      "url" : "http://192.168.33.10:8080/job/seedjob1/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.maven.MavenModuleSet",
      "name" : "Spring3hybernate",
      "url" : "http://192.168.33.10:8080/job/Spring3hybernate/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "Staticcodedeployer",
      "url" : "http://192.168.33.10:8080/job/Staticcodedeployer/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "tagcreator",
      "url" : "http://192.168.33.10:8080/job/tagcreator/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "test",
      "url" : "http://192.168.33.10:8080/job/test/",
      "color" : "blue"
    },
    {
      "_class" : "hudson.model.FreeStyleProject",
      "name" : "UPSTREAMJOB",
      "url" : "http://192.168.33.10:8080/job/UPSTREAMJOB/",
      "color" : "blue"
    }
  ],
  "overallLoad" : {
    
  },
  "primaryView" : {
    "_class" : "hudson.model.AllView",
    "name" : "all",
    "url" : "http://192.168.33.10:8080/"
  },
  "quietingDown" : false,
  "slaveAgentPort" : -1,
  "unlabeledLoad" : {
    "_class" : "jenkins.model.UnlabeledLoadStatistics"
  },
  "useCrumbs" : true,
  "useSecurity" : true,
  "views" : [
    {
      "_class" : "hudson.model.AllView",
      "name" : "all",
      "url" : "http://192.168.33.10:8080/"
    },
    {
      "_class" : "hudson.plugins.nested_view.NestedView",
      "name" : "complex-jobs",
      "url" : "http://192.168.33.10:8080/view/complex-jobs/"
    },
    {
      "_class" : "hudson.plugins.nested_view.NestedView",
      "name" : "simple-jobs",
      "url" : "http://192.168.33.10:8080/view/simple-jobs/"
    }
  ]
}

2. Get the last build status
Command:
```
curl -u tarungoel1995:11d5e1c07cb82e34b45bf909e21f0403 http://192.168.33.10:8080/job/Hello%20World/lastSuccessfulBuild/api/json
```

Output:
{"_class":"hudson.model.FreeStyleBuild","actions":[{"_class":"hudson.model.CauseAction","causes":[{"_class":"hudson.model.Cause$UpstreamCause","shortDescription":"Started by upstream project \"descriptive\" build number 2","upstreamBuild":2,"upstreamProject":"descriptive","upstreamUrl":"job/descriptive/"}]},{},{},{}],"artifacts":[],"building":false,"description":null,"displayName":"#3","duration":53,"estimatedDuration":51,"executor":null,"fullDisplayName":"Hello World #3","id":"3","keepLog":false,"number":3,"queueId":92,"result":"SUCCESS","timestamp":1528383688682,"url":"http://192.168.33.10:8080/job/Hello%20World/3/","builtOn":"","changeSet":{"_class":"hudson.scm.EmptyChangeLogSet","items":[],"kind":null},"culprits":[]}

3. Get the console o/p of a job build.
Command:
```
curl -s -S -u tarungoel1995:11d5e1c07cb82e34b45bf909e21f0403 http://192.168.33.10:8080/job/Hello%20World/3/logText/progressiveText?start=0
```

Output:
Started by upstream project "descriptive" build number 2
originally caused by:
 Started by user Tarun Goel
Building in workspace /var/lib/jenkins/workspace/Hello World
[Hello World] $ /bin/sh -xe /tmp/jenkins4804077634826307492.sh
+ echo Hello World
Hello World
Triggering a new build of UPSTREAMJOB
Finished: SUCCESS

4. Trigger a jenkins job build
Command:
```
curl -u tarungoel1995:11d5e1c07cb82e34b45bf909e21f0403 -X POST http://192.168.33.10:8080/job/Hello%20World/build
```

Output:
#you will see that a build is triggered in that job.
