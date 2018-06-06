job('PERIODICAL'){
scm{
git ('https://github.com/tarungoel1995/jenkins.git')
}
triggers {
cron('*/5 * * * *')
}
}
