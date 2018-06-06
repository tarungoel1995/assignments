job('GIT CLONE'){
scm{
git('https://github.com/tarungoel1995/jenkins.git')
}
steps{
shell ('ls')
}
}
