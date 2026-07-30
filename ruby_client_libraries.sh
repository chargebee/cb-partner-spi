#!/bin/bash

# Make script executable
chmod +x "$0"

# Function to show usage
show_usage() {
    echo "Usage: $0 <spec-file-path>"
    echo "Example: $0 spec/api/openapi.yml"
    exit 1
}

# Check if required argument is provided
if [ $# -ne 1 ]; then
    show_usage
fi

SPEC_FILE="$1"
SPEC_FILENAME=$(basename "$SPEC_FILE" .yml)
OUTPUT_DIR="../generated_client_library"

# Check if OpenAPI Generator is installed
if ! command -v openapi-generator &> /dev/null; then
    echo "OpenAPI Generator is not installed. Please install it first:"
    echo "npm install @openapitools/openapi-generator-cli -g"
    echo "or: brew install openapi-generator"
    exit 1
fi

# Verify spec file exists
if [ ! -f "$SPEC_FILE" ]; then
    echo "Error: Spec file not found: $SPEC_FILE"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Generate Ruby client library
echo "Generating Ruby client library from $SPEC_FILE..."
openapi-generator generate \
    -i "$SPEC_FILE" \
    -g ruby \
    -o "$OUTPUT_DIR" \
    --additional-properties=gemName=cb-api-client \
    --additional-properties=moduleName=CbClient \
    --additional-properties=gemVersion=1.0.0 \
    --additional-properties=gemAuthor="Your Name" \
    --additional-properties=gemAuthorEmail="your.email@example.com"

# Check if generation was successful
if [ $? -eq 0 ]; then
    echo "Successfully generated Ruby client library in: $OUTPUT_DIR"
    echo "To build and install the gem:"
    echo "  cd $OUTPUT_DIR"
    echo "  gem build *.gemspec"
    echo "  gem install *.gem"
else
    echo "Error: Failed to generate client library"
    exit 1
fi