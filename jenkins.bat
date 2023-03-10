pipeline {
    agent none
    stages {
        stage('Non-Parallel Stage') {
            agent {
                label "Agent WIndows_Node"
            }
           steps {
               echo "This stage will be executed first";
           }
        }
        stage('Run Tests'){
            parallel {
        stage('Test on Windows'){
            agent {
                label "Windows_Node"
            }
            steps {
                echo "Task1 on Windows_Node";
            }
        }
          stage('Test On Master') {
              agent {
                  label "Agent WIndows_Node"
              }
            steps {
                echo "Task1 on Agent WIndows_Node";
            }
        }
            }
           
        }
       
        
    }
}