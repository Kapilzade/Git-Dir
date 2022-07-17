node {  
    stage('Pull') { 
      git branch: 'main', credentialsId: 'github', url: 'https://github.com/Kapilzade/student-app.git'   
    }
    stage('Build') { 
        echo "build done"
    }
    stage('Deploy') { 
        echo "Deploy Done"
        
    }
     
}
