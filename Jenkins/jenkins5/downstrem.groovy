job('DOWNSTREAM'){
 steps {
        downstreamParameterized {
            trigger('Hello Person') {
                block {
                    buildStepFailure('FAILURE')
                    failure('FAILURE')
                    unstable('UNSTABLE')
                }
                parameters {
                    
                    predefinedProps([SALUTATION: 'Mr.', NAME: 'Tarun'])
                }
            
          
                
            }
        }
    }
}
