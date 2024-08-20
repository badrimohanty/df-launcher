# Use the distroless Python 3.11 image
FROM gcr.io/distroless/python3:sha256-acbccdf055d0b660b7be5a204c04b0d0ccd3199e5a225594eca8c5db0e139b06.sig

# Copy files from official SDK image (this includes Python and necessary dependencies)
COPY --from=apache/beam_python3.11_sdk:2.58.1 /opt/apache/beam /opt/apache/beam

# Set the entrypoint to Apache Beam SDK launcher.
ENTRYPOINT ["/opt/apache/beam/boot"]
