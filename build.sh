#!/bin/bash
set -e

# SCL/SCD Extension Build Script for Zed

echo "Building SCL/SCD Extension for Zed..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [[ ! -f "extension.toml" ]]; then
    print_error "extension.toml not found. Please run this script from the project root."
    exit 1
fi

# Check if Rust is installed
if ! command -v cargo &> /dev/null; then
    print_error "Cargo (Rust) is not installed. Please install Rust from https://rustup.rs/"
    exit 1
fi

# Check if Zed is installed
if ! command -v zed &> /dev/null && [[ ! -d "/Applications/Zed.app" ]] && [[ ! -f "/usr/local/bin/zed" ]]; then
    print_warning "Zed editor not found in common locations. Make sure Zed is installed."
fi

# Clean previous builds
print_status "Cleaning previous builds..."
cargo clean

# Format code
print_status "Formatting Rust code..."
cargo fmt

# Run clippy for linting
print_status "Running clippy linter..."
cargo clippy -- -D warnings

# Build the extension
print_status "Building extension..."
cargo build --release

# Check if build was successful
if [[ $? -eq 0 ]]; then
    print_status "Build completed successfully!"
else
    print_error "Build failed!"
    exit 1
fi

# Get Zed extensions directory
ZED_EXTENSIONS_DIR=""
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    ZED_EXTENSIONS_DIR="$HOME/Library/Application Support/Zed/extensions"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    ZED_EXTENSIONS_DIR="$HOME/.config/zed/extensions"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows
    ZED_EXTENSIONS_DIR="$APPDATA/Zed/extensions"
else
    print_warning "Unknown OS type. Please manually copy the extension to your Zed extensions directory."
fi

# Install extension if Zed directory exists
if [[ -n "$ZED_EXTENSIONS_DIR" ]]; then
    EXTENSION_TARGET_DIR="$ZED_EXTENSIONS_DIR/scl"

    if [[ -d "$ZED_EXTENSIONS_DIR" ]]; then
        print_status "Installing extension to Zed extensions directory..."

        # Create extensions directory if it doesn't exist
        mkdir -p "$ZED_EXTENSIONS_DIR"

        # Remove existing installation
        if [[ -d "$EXTENSION_TARGET_DIR" ]]; then
            print_status "Removing existing installation..."
            rm -rf "$EXTENSION_TARGET_DIR"
        fi

        # Copy extension files
        mkdir -p "$EXTENSION_TARGET_DIR"

        # Copy essential files
        cp extension.toml "$EXTENSION_TARGET_DIR/"
        cp Cargo.toml "$EXTENSION_TARGET_DIR/"
        cp -r src "$EXTENSION_TARGET_DIR/"
        cp -r languages "$EXTENSION_TARGET_DIR/"
        cp -r target "$EXTENSION_TARGET_DIR/"

        # Copy documentation
        cp README.md "$EXTENSION_TARGET_DIR/" 2>/dev/null || true
        cp CHANGELOG.md "$EXTENSION_TARGET_DIR/" 2>/dev/null || true

        print_status "Extension installed to: $EXTENSION_TARGET_DIR"
        print_status "Restart Zed to load the extension."
    else
        print_warning "Zed extensions directory not found at: $ZED_EXTENSIONS_DIR"
        print_warning "Please manually copy the extension files."
    fi
fi

# Run tests if they exist
if [[ -f "tests/" ]] || grep -q "\[\[test\]\]" src/*.rs 2>/dev/null; then
    print_status "Running tests..."
    cargo test
fi

# Validate extension.toml
print_status "Validating extension configuration..."
if command -v toml &> /dev/null; then
    toml validate extension.toml
elif command -v python3 &> /dev/null; then
    python3 -c "
import tomli
try:
    with open('extension.toml', 'rb') as f:
        tomli.load(f)
    print('extension.toml is valid')
except Exception as e:
    print(f'extension.toml validation failed: {e}')
    exit(1)
    "
else
    print_warning "Could not validate extension.toml (toml or python3 not found)"
fi

# Check for required dependencies
print_status "Checking for scl-lsp language server..."
if command -v scl-lsp &> /dev/null; then
    print_status "scl-lsp found: $(which scl-lsp)"
    scl-lsp --version 2>/dev/null || print_warning "Could not get scl-lsp version"
else
    print_warning "scl-lsp not found in PATH. The extension requires scl-lsp to be installed."
    print_warning "Please install scl-lsp language server for full functionality."
fi

# Summary
echo ""
print_status "Build Summary:"
echo "  - Extension built successfully"
echo "  - Target: target/release/"
if [[ -n "$ZED_EXTENSIONS_DIR" && -d "$ZED_EXTENSIONS_DIR" ]]; then
    echo "  - Installed to: $EXTENSION_TARGET_DIR"
fi
echo ""
print_status "To use the extension:"
echo "  1. Restart Zed editor"
echo "  2. Open .scl or .scd files"
echo "  3. Ensure scl-lsp is installed and in PATH"
echo ""
print_status "Build completed successfully!"
