# Use the latest Jenkins LTS image
FROM jenkins/jenkins:lts

# Set environment variables for Jenkins
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"


# Install Jenkins plugins using jenkins-plugin-cli
RUN jenkins-plugin-cli --plugins \
    configuration-as-code \
    role-strategy \
    matrix-auth \
    workflow-aggregator \
    kubernetes \
    slack \
    pipeline-utility-steps \
    blueocean \
    docker-workflow \
    job-dsl \
    workflow-cps \
    credentials-binding \
    kubernetes-credentials-provider \
    workflow-job \
    pipeline-stage-view \
    pipeline-build-step \
    pipeline-input-step \
    pipeline-milestone-step \
    pipeline-model-definition \
    git-client \
    pipeline-rest-api \
    credentials \
    plain-credentials \
    ssh-credentials \
    cloudbees-folder \
    branch-api \
    workflow-multibranch

# Set user permissions (ensure Jenkins runs as a non-root user)
#USER jenkins