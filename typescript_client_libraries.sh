#!/bin/bash

# Make script executable
chmod +x "$0"


# Validate input arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-spec-file>"
    echo "Example: $0 spec/spi/openapi_tax.yml"
    exit 1
fi

# Get absolute path of the spec file
SPEC_FILE=$(realpath "$1")

# Validate if spec file exists
if [ ! -f "$SPEC_FILE" ]; then
    echo "Error: Spec file does not exist: $SPEC_FILE"
    exit 1
fi

# Extract filename without extension to use as package name
FILENAME=$(basename "$SPEC_FILE")
PACKAGE_NAME="${FILENAME%.*}"

# Create output directory structure (one level up from current directory)
OUTPUT_DIR="../${PACKAGE_NAME}-client"
mkdir -p "$OUTPUT_DIR"

# Check if openapi-generator-cli is installed
if ! command -v openapi-generator-cli &> /dev/null; then
    echo "openapi-generator-cli not found. Installing..."
    npm install @openapitools/openapi-generator-cli -g
fi

# Generate TypeScript client library
echo "Generating TypeScript client library for $PACKAGE_NAME..."
openapi-generator-cli generate \
    -i "$SPEC_FILE" \
    -g typescript-fetch \
    -o "$OUTPUT_DIR" \
    --additional-properties=\
npmName="@yourorg/${PACKAGE_NAME}-client",\
npmVersion="1.0.0",\
supportsES6=true,\
modelPropertyNaming=camelCase,\
enumPropertyNaming=UPPERCASE

# Create package.json if it doesn't exist
if [ ! -f "$OUTPUT_DIR/package.json" ]; then
    echo "Creating package.json..."
    cat > "$OUTPUT_DIR/package.json" << EOF
{
    "name": "@yourorg/${PACKAGE_NAME}-client",
    "version": "1.0.0",
    "description": "Generated TypeScript client for ${PACKAGE_NAME}",
    "main": "dist/index.js",
    "types": "dist/index.d.ts",
    "scripts": {
        "build": "tsc",
        "prepare": "npm run build"
    },
    "dependencies": {
        "fetch-api": "^0.0.2",
        "portable-fetch": "^3.0.0"
    },
    "devDependencies": {
        "typescript": "^4.9.5",
        "@types/node": "^18.15.0"
    }
}
EOF
fi

# Create tsconfig.json if it doesn't exist
if [ ! -f "$OUTPUT_DIR/tsconfig.json" ]; then
    echo "Creating tsconfig.json..."
    cat > "$OUTPUT_DIR/tsconfig.json" << EOF
{
    "compilerOptions": {
        "target": "es6",
        "module": "commonjs",
        "declaration": true,
        "outDir": "./dist",
        "strict": true,
        "esModuleInterop": true,
        "skipLibCheck": true,
        "forceConsistentCasingInFileNames": true
    },
    "include": ["src/**/*"],
    "exclude": ["node_modules", "dist"]
}
EOF
fi

# Install dependencies
echo "Installing dependencies..."
cd "$OUTPUT_DIR"
npm install

# Build the project
echo "Building the project..."
npm run build

echo "TypeScript client library generated successfully!"
echo "Location: $OUTPUT_DIR"
echo ""
echo "To use this client library in your project:"
echo "1. Copy the generated directory to your project"
echo "2. Install it locally using: npm install <path-to-generated-directory>"
echo "3. Import and use the generated classes in your TypeScript code"