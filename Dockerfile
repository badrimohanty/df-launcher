FROM marketplace.gcr.io/google/debian11:latest

# Install Python 3.11
RUN apt-get update && \
    apt-get install -y python3.11 python3.11-dev python3-pip

# Install Apache Beam SDK
RUN pip3 install --no-cache-dir apache-beam[gcp]==2.58.1

# Verify dependencies
RUN pip3 check

# Copy files from official SDK image
COPY --from=apache/beam_python3.11_sdk:2.58.1 /opt/apache/beam /opt/apache/beam

# Set entrypoint
ENTRYPOINT ["/opt/apache/beam/boot"]
