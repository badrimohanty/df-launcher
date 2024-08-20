FROM python:3.11-bookworm AS build-env

# Install SDK.
RUN pip install --no-cache-dir apache-beam[gcp]==2.58.1

COPY --from=apache/beam_python3.11_sdk:2.58.1 /opt/apache/beam /opt/apache/beam
# Verify that the image does not have conflicting dependencies.
RUN pip check

FROM gcr.io/distroless/python3
# Copy files from official SDK image, including script/dependencies.
COPY --from=build-env /opt/apache/beam /opt/apache/beam

# Set the entrypoint to Apache Beam SDK launcher.
ENTRYPOINT ["/opt/apache/beam/boot"]
