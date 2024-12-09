#!/bin/bash

# Make script executable
chmod +x "$0"

# Check if openapi-generator-cli is installed
if ! command -v openapi-generator-cli &> /dev/null; then
    echo "Error: openapi-generator-cli is not installed"
    echo "Please install it using: npm install @openapitools/openapi-generator-cli -g"
    exit 1
fi

# Check if argument is provided
if [ -z "$1" ]; then
    echo "Error: Please provide the path to the OpenAPI specification file"
    echo "Usage: $0 <path-to-spec-file>"
    exit 1
fi

# Validate if the spec file exists
if [ ! -f "$1" ]; then
    echo "Error: Specification file not found at path: $1"
    exit 1
fi

# Get the base name of the spec file without extension
SPEC_NAME=$(basename "$1" | sed 's/\.[^.]*$//')

# Create output directory outside cb-provider-spi
OUTPUT_DIR="../generated-clients-libraies/php/${SPEC_NAME}"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Generate PHP client library
echo "Generating PHP client library for $SPEC_NAME..."
openapi-generator-cli generate \
    -i "$1" \
    -g php \
    -o "$OUTPUT_DIR" \
    --additional-properties=invokerPackage="Generated\\${SPEC_NAME}",packageName="${SPEC_NAME}",composerPackageName="generated/${SPEC_NAME}" \
    --global-property=apiTests=false,modelTests=false

# Generate composer.json if it doesn't exist
if [ ! -f "$OUTPUT_DIR/composer.json" ]; then
    cat > "$OUTPUT_DIR/composer.json" << EOL
{
    "name": "generated/${SPEC_NAME}",
    "description": "Generated PHP client for ${SPEC_NAME}",
    "type": "library",
    "require": {
        "php": ">=7.4",
        "guzzlehttp/guzzle": "^7.0",
        "ext-json": "*"
    },
    "autoload": {
        "psr-4": {
            "Generated\\\\${SPEC_NAME}\\\\": "lib/"
        }
    }
}
EOL
fi

echo "Successfully generated PHP client library at: $OUTPUT_DIR"
echo "To use this library in your project:"
echo "1. Copy the generated directory to your project's vendor directory"
echo "2. Add the following to your project's composer.json 'require' section:"
echo "   \"generated/${SPEC_NAME}\": \"*\""
echo "3. Update your project's autoloader"