FROM jenkins/jenkins:lts
MAINTAINER eactisgrosso

ARG GOSU_VERSION=1.10

USER root

# Essentials
RUN apt-get update && apt-get -y install \
	python \
	curl \
	unzip \
	zip \
	apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common \
	libunwind8 \ 
	gettext \ 
	jq

# DOCKER
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
 	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
 	&& chmod +x /usr/local/bin/gosu \
 	&& gosu nobody true \
 	&& curl -sSL https://get.docker.com/ | sh \
 	&& apt-get clean \
 	&& rm -rf /var/lib/apt/lists/*	

# AWS CLI	
RUN cd /tmp \ 
	&& curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \ 
	&& unzip awscli-bundle.zip \
	&& ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
	&& rm awscli-bundle.zip && rm -rf awscli-bundle

# DOTNET
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV DOTNET_SKIP_FIRST_TIME_EXPERIENCE 1

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
	&& mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
	&& sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list' \
	&& apt-get update \
	&& apt-get -y install dotnet-sdk-2.0.0 \
	&& apt-get -y install dotnet-sdk-2.1 \
	&& dotnet new -i Amazon.Lambda.Templates::* \

# NODE
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
	&& apt-get install -y nodejs

# HUGO
RUN curl -L >hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.40.2/hugo_0.40.2_Linux-64bit.tar.gz \
 	&& tar -xzvf hugo.tar.gz -C /usr/bin \
 	&& rm hugo.tar.gz

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
