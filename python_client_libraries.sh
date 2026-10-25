#!/bin/sh

# Self-executing script
(
# Check if OpenAPI Generator CLI is installed
if ! command -v openapi-generator-cli > /dev/null 2>&1; then
    echo "OpenAPI Generator CLI is not installed. Please install it first."
    echo "You can install it using: npm install @openapitools/openapi-generator-cli -g"
    exit 1
fi

# Check if the spec file path is provided
if [ $# -eq 0 ]; then
    echo "Please provide the path to the OpenAPI spec file as an argument."
    echo "Usage: sh $0 <path_to_spec_file>"
    exit 1
fi

# Get the absolute path of the spec file
SPEC_FILE=$(realpath "$1")

# Check if the spec file exists
if [ ! -f "$SPEC_FILE" ]; then
    echo "The specified OpenAPI spec file does not exist: $SPEC_FILE"
    exit 1
fi

# Create a directory for the generated client libraries
# This will be one level up from the current directory (cb-provider-spi)
OUTPUT_DIR="../generated_client_library"
mkdir -p "$OUTPUT_DIR"

# Generate the client library (including models and APIs)
openapi-generator-cli generate \
    -i "$SPEC_FILE" \
    -g python \
    -o "$OUTPUT_DIR" \
    --additional-properties packageName=generated_client

echo "Client library (including models and APIs) has been generated in $OUTPUT_DIR"
echo "You can now import and use these in your Python projects."

exit 0
) && exit 0

echo "An error occurred while executing the script."
exit 1