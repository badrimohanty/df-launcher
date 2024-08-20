# Use the distroless Python 3.11 image
FROM gcr.io/distroless/python3.11

# Copy files from official SDK image (this includes Python and necessary dependencies)
COPY --from=apache/beam_python3.11_sdk:2.58.1 /opt/apache/beam /opt/apache/beam

# Set the entrypoint to Apache Beam SDK launcher.
ENTRYPOINT ["/opt/apache/beam/boot"]
