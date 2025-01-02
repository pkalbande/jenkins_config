FROM jenkins/jenkins:lts-jdk11

# Switch to root to install additional packages
USER root

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    git \
    apt-transport-https \
    curl \
    docker.io \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Switch back to jenkins user
USER jenkins

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins \
    configuration-as-code \
    role-strategy \
    google-login \
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
    workflow-multibranch \
    workflow-durable-task-step \
    durable-task \
    variant

# Create required directories with correct permissions
#RUN mkdir -p /var/jenkins_home/casc_configs && \
#    chown -R jenkins:jenkins /var/jenkins_home/casc_configs

# Copy JCasC configuration
#COPY --chown=jenkins:jenkins jcasc-config.yaml /var/jenkins_home/casc_configs/

# Set Jenkins Configuration as Code location
#ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jcasc-config.yaml