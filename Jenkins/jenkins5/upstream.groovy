job('UPSTREAMJOB'){
triggers{
upstream('Hello World','SUCCESS')
}
steps{
shell('echo "This is downstream of Hello World"')
}
}
