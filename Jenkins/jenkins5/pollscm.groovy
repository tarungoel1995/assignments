job('POLLSCM'){
scm{
git('https://github.com/tarungoel1995/jenkins.git') 
}
triggers{
scm('*/2 * * * * ')
}
}
