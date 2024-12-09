#!/bin/bash

# Make script executable
chmod +x "$0"

# Function to show usage
show_usage() {
    echo "Usage: $0 <spec-file-path>"
    echo "Example: $0 spec/spi/openapi_tax.yml"
    exit 1
}

# Check if required argument is provided
if [ $# -ne 1 ]; then
    show_usage
fi

SPEC_FILE="$1"
SPEC_FILENAME=$(basename "$SPEC_FILE" .yml)
PARENT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUTPUT_DIR="$PARENT_DIR/generated-clients/${SPEC_FILENAME}-client"

# Create tools directory if it doesn't exist
mkdir -p tools

# Function to get latest stable OpenAPI Generator version
get_latest_version() {
    curl -s https://api.github.com/repos/OpenAPITools/openapi-generator/releases/latest |
    grep "tag_name" |
    cut -d '"' -f 4 |
    sed 's/v//'
}

# Download OpenAPI Generator if it doesn't exist
if [ ! -f "tools/openapi-generator-cli.jar" ]; then
    echo "Downloading OpenAPI Generator CLI..."
    VERSION=$(get_latest_version)
    curl -L "https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$VERSION/openapi-generator-cli-$VERSION.jar" -o "tools/openapi-generator-cli.jar"
fi

# Verify spec file exists
if [ ! -f "$SPEC_FILE" ]; then
    echo "Error: Spec file not found: $SPEC_FILE"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Generate Java client library
echo "Generating Java client library from $SPEC_FILE..."
java -jar "tools/openapi-generator-cli.jar" generate \
    -i "$SPEC_FILE" \
    -g java \
    -o "$OUTPUT_DIR" \
    --api-package com.cb.client.api \
    --model-package com.cb.client.model \
    --group-id com.cb \
    --artifact-id cb-api-client \
    --artifact-version 1.0.0 \
    --library resttemplate \
    -p java8=true \
    -p dateLibrary=java8 \
    -p hideGenerationTimestamp=true

# Check if generation was successful
if [ $? -eq 0 ]; then
    echo "Successfully generated Java client library in: $OUTPUT_DIR"
    echo "You can now import this library into your project."
    echo "The generated library contains:"
    echo "  - API classes in: $OUTPUT_DIR/src/main/java/com/cb/client/api"
    echo "  - Model classes in: $OUTPUT_DIR/src/main/java/com/cb/client/model"
else
    echo "Error: Failed to generate client library"
    exit 1
fi