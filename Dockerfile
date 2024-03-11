# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# Update package information and upgrade existing packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install required packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
    apt-transport-https \
    apt-utils \
    ca-certificates \
    curl \
    git \
    iputils-ping \
    jq \
    lsb-release \
    software-properties-common

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Set the environment variable for the target architecture
ENV TARGETARCH=linux-x64

# Set the working directory
WORKDIR /azp

# Copy the start.sh script
COPY ./start.sh .

# Make start.sh executable
RUN chmod +x start.sh

# Define the entry point
ENTRYPOINT [ "./start.sh" ]
