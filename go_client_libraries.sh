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

# Generate Go client library
echo "Generating Go client library from $SPEC_FILE..."
openapi-generator generate \
    -i "$SPEC_FILE" \
    -g go \
    -o "$OUTPUT_DIR" \
    --additional-properties=packageName=cbclient \
    --additional-properties=isGoSubmodule=true \
    --additional-properties=withGoCodegenComment=true \
    --additional-properties=structPrefix=true \
    --additional-properties=packageVersion=1.0.0 \
    --git-repo-id cb-api-client-go \
    --git-user-id cb

# If generation was successful, reorganize the files
if [ $? -eq 0 ]; then
    echo "Client generated successfully. Now reorganizing files..."
    
    # Create directories for models and api
    mkdir -p "$OUTPUT_DIR/models"
    mkdir -p "$OUTPUT_DIR/api"
    
    # Move model files to models directory
    find "$OUTPUT_DIR" -name "model_*.go" -exec mv {} "$OUTPUT_DIR/models/" \;
    
    # Move API files to api directory
    find "$OUTPUT_DIR" -name "api_*.go" -exec mv {} "$OUTPUT_DIR/api/" \;
    
    # Update import paths in all go files
    find "$OUTPUT_DIR" -name "*.go" -exec sed -i.bak 's|import (|import (\n\t"github.com/cb/cb-api-client-go/models"\n\t"github.com/cb/cb-api-client-go/api"|' {} \;
    find "$OUTPUT_DIR" -name "*.go.bak" -delete
    
    echo "Successfully generated Go client library in: $OUTPUT_DIR"
    echo "APIs are in: $OUTPUT_DIR/api"
    echo "Models are in: $OUTPUT_DIR/models"
    echo "You can now import this library into your project."
else
    echo "Error: Failed to generate client library"
    exit 1
fi