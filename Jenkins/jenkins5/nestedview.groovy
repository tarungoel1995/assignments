job('Nested View') {
  nestedView('simple-jobs') {
    views {
        listView('"Hello World","Hello Person", "GIT CLONE", "PERIODICAL","POLLSCM"') 
      {      
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
        listView('"UPSTREAM", "DOWNSTREAM"') {
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
