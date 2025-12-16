// Jenkinsfile (Declarative Pipeline)
pipeline {
    // Агент, де будуть виконуватися етапи (має мати доступ до Docker)
    agent any

    // Змінні, які використовуються в пайплайні
    environment {
        // !!! Обов'язково ЗАМІНІТЬ 'your_dockerhub_username' на ваш реальний логін Docker Hub
        DOCKER_USERNAME = 'your_dockerhub_username' 
        IMAGE_NAME = "lab11-jenkins-app" // Назва образу
        TAG = "${env.BUILD_ID}"          // Тег образу (використовуємо номер збірки Jenkins)
        // ID облікових даних Jenkins: має відповідати тому, що ви створите на Кроці 2
        CREDENTIALS_ID = 'dockerhub-creds' 
    }

    stages {
        stage('Checkout') {
            steps {
                echo "1. Checking out code from Git..."
                // Jenkins автоматично виконає git clone/checkout, коли скрипт зчитується з SCM.
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "2. Building Docker Image: ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"
                // Збірка образу з Dockerfile, який знаходиться у корені репозиторію
                // Тег -t: локальна назва, використовується для ідентифікації при наступному тагуванні
                sh "docker build -t ${IMAGE_NAME}:${TAG} ."
            }
        }

        stage('Test') {
            steps {
                echo "3. Running tests..."
                // Тут мають бути реальні команди тестування, наприклад, для Docker-образу
                // sh "docker run --rm ${IMAGE_NAME}:${TAG} /run_tests.sh"
                sh 'echo "Simulated Tests Passed!"' // Імітація
            }
        }
        
        stage('Push to DockerHub') {
            steps {
                echo "4. Tagging and Pushing Image to DockerHub"
                
                // 1. Tagging: Перейменовуємо образ, додаючи логін Docker Hub
                sh "docker tag ${IMAGE_NAME}:${TAG} ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"

                // 2. Login: Безпечний вхід за допомогою Jenkins Credentials
                withCredentials([usernamePassword(
                    credentialsId: env.CREDENTIALS_ID, 
                    usernameVariable: 'DOCKER_USER', 
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh 'echo "Logging into Docker Hub..."'
                    // Вхід через STDIN для безпеки пароля
                    sh "echo \"${DOCKER_PASSWORD}\" | docker login -u \"${DOCKER_USER}\" --password-stdin"
                }

                // 3. Push: Відправляємо образ
                sh "docker push ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"
                sh "echo \"Image pushed successfully: ${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}\""
            }
        }
    }
    post {
        always {
            // Вихід з Docker Hub після завершення
            sh 'docker logout' 
            echo "Pipeline finished. Image pushed to Docker Hub."
        }
    }
}
