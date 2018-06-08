job('Nested View') {
  nestedView('simple-jobs') {
    views {
        listView('Simple jobs') 
      {      jobs{
        names('Hello World','Hello Person','GIT CLONE','PERIODICAL','POLLSCM')
      }
            columns {
                status()
                weather()
                name()
                lastSuccess()
                lastFailure()
            }
        }
        }
  }
      nestedView('complex-jobs') {
    views {
        listView('Complex-jobs') {
          jobs{
          names('UPSTREAMJOB','DOWNSTREAM')
          }
            columns {
                status()
                weather()
                name()
                lastSuccess()
                lastFailure()
            }
        }
    }  
    }
    }
