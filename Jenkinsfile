// Jenkinsfile (Declarative Pipeline)
pipeline {
    // Вказує, де повинен виконуватися пайплайн. 'any' означає на будь-якому доступному агентові.
    agent any

    // Блок для визначення змінних, які будуть використовуватися в пайплайні
    environment {
        APP_VERSION = '1.0.0'
    }

    // Блок, що містить усі етапи (Stages)
    stages {
        // Етап, який зазвичай виконується автоматично при використанні SCM,
        // але його можна явно вказати для демонстрації логіки.
        stage('Checkout') {
            steps {
                echo "=== 1. Checking out code from Git... ==="
                // У реальному проєкті тут були б команди git clone або checkout
                // Для цієї ЛР етап імітує завантаження коду
            }
        }

        // Етап збірки (компіляції) проєкту
        stage('Build') {
            steps {
                echo "=== 2. Building application v${APP_VERSION}... ==="
                // У реальному проєкті тут були б команди: mvn package або npm install
                // Для цієї ЛР імітуємо збірку
                sh 'echo "Simulated Build Successful!"' // Виконання shell-команди [cite: 49, 53]
            }
        }

        // Етап тестування
        stage('Test') {
            steps {
                echo "=== 3. Running tests... ==="
                // У реальному проєкті тут були б команди: mvn test або npm test
                // Імітуємо виконання тестів
                sh 'echo "Simulated Tests Passed!"' // Виконання shell-команди [cite: 55, 59]
            }
        }

        // Етап розгортання
        stage('Deploy') {
            when {
                // Умова, що етап Deploy запускається лише на гілці 'main' (або 'master')
                branch 'main'
            }
            steps {
                echo "=== 4. Deploying application v${APP_VERSION} to environment... ==="
                // У реальному проєкті тут були б команди: ssh, scp, docker push
                // Імітуємо розгортання
                sh 'echo "Simulated Deployment Successful!"'
            }
        }
    }
    // Блок, що виконується після завершення всіх етапів (незалежно від статусу)
    post {
        always {
            echo "Pipeline finished. Version: ${APP_VERSION}"
        }
    }
}
