Github Webhook using Jenkins

Step 1:

Create a freestyle job

From general section select github project and paste the url of your project in

![githubprojetc](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/Github%20project.png)

Go to SCM section and select git and paster the url of your project in.

![scm](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/gitrepo.png)

Go to build triggers and select GitHub hook trigger for GITScm polling.
Hit apply and save.

![buildtriggers](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/triggers.png)


Step 2:

Go to manage jenkins and click configure system

Go to Github servers and click advanced button

Click manage additional GitHub actions

Select convert login and password to token

Select from login and password

Type your github username and password and click create token credentials

![tokengeneration](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/tokengeneration.png)

Click Add Github server

![githubserver](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/addinggithubserver.png) 

Go ahead and select the credentials that we just created.

Hit apply and save

Step 3:

Go to your project Github repository and from the settings section click Integerations and services.

Select add services and select Jenkins (Github Plugin) 

![githubjenkinsplugin](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/addingjenkinsgithubplugin.png)

add the url of your jenkins server followed by github-webhook

e.g http;//52.35.150.219/github-webhook

make sure to select active box

click on add service

![service](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/serverurlinservice.png)

If you like you can test the service, click edit and select test service

![testingservice](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/testingservice.png)

You will see a webhook is also created click webhooks section to verify.

![webhook](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/webhook.png)

Step 4:

Push any code in your repository you will see automatically a job is triggered in your jenkins server.

Adding test.txt

![adding test.txt](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/adding%20test.txt.png)

Just after committing a new job is triggered in jenkins server

![triggered job](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/newbuildtriggered.png)

Console output of job

![verification](https://github.com/tarungoel1995/assignments/blob/master/git/webhook/media/addedtest.txtinbuild.png)
