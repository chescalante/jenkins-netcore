# Jenkins ready for .NET Core & React apps CI
Docker in Docker Jenkins setup, ready for deployment of netcore services & react apps to Amazon ECS.

# Usage

```
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home eactisgrosso/jenkins-netcore
```

This will automatically create a 'jenkins_home' volume on docker host, that will survive container stop/restart/deletion.

# Pre-installed

Docker  
AWS CLI  
Netcore 2.0 & 2.1  
Node.js

# Plugins

jsch:0.1.54.2  
workflow-step-api:2.16  
pipeline-model-definition:1.3.1  
workflow-cps-global-lib:2.9  
mstest:0.23  
script-security:1.44  
build-timeout:1.19  
branch-api:2.0.20  
github-branch-source:2.3.6  
mapdb-api:1.0.9.0  
pipeline-stage-tags-metadata:1.3.1  
workflow-multibranch:2.20  
cloudbees-bitbucket-branch-source:2.2.12  
apache-httpcomponents-client-4-api:4.5.5-3.0  
email-ext:2.62  
workflow-aggregator:2.5  
msbuild:1.29  
handy-uri-templates-2-api:2.1.6-1.0  
pam-auth:1.3  
docker-workflow:1.17  
ssh-slaves:1.26  
pipeline-rest-api:2.10  
pipeline-build-step:2.7  
pipeline-graph-analysis:1.7  
git:3.9.1  
bouncycastle-api:2.16.3  
workflow-cps:2.54  
ssh-credentials:1.14  
ant:1.8  
jackson2-api:2.8.11.3  
github-api:1.92  
workflow-scm-step:2.6  
git-server:1.7  
nunit:0.23  
aws-credentials:1.23  
token-macro:2.5  
resource-disposer:0.11  
cloudbees-folder:6.5.1  
github:1.29.2  
matrix-project:1.13  
pipeline-stage-step:2.3  
authentication-tokens:1.3  
subversion:2.11.1  
ldap:1.20  
handlebars:1.1.1  
pipeline-github-lib:1.0  
workflow-support:2.19  
jdk-tool:1.1  
bitbucket:1.1.8  
htmlpublisher:1.16  
monitoring:1.73.1  
workflow-job:2.23  
display-url-api:2.2.0  
jquery-detached:1.2.1  
junit:1.24  
pipeline-model-extensions:1.3.1  
pipeline-input-step:2.8  
antisamy-markup-formatter:1.5  
mercurial:2.4  
mailer:1.21  
pipeline-model-declarative-agent:1.1.1  
scm-api:2.2.7  
gradle:1.29  
pipeline-stage-view:2.10  
credentials:2.1.17  
pipeline-model-api:1.3.1  
pipeline-milestone-step:1.3.1  
ws-cleanup:0.34  
ace-editor:1.1  
plain-credentials:1.4  
matrix-auth:2.3  
momentjs:1.1.1  
timestamper:1.8.10  
docker-commons:1.13  
git-client:2.7.2  
credentials-binding:1.16  
workflow-api:2.28  
structs:1.14  
command-launcher:1.2  
amazon-ecr:1.6  
aws-java-sdk:1.11.341  
workflow-basic-steps:2.9  
workflow-durable-task-step:2.19  
durable-task:1.22  