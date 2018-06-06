job('Hello Person'){
parameters {
stringParam('NAME','')
choiceParam('SALUTATION',['Mr.','Mrs.'])
}
steps{
shell('echo "Hello $SALUTATION $NAME"')
 }
}
