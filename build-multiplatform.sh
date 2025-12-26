#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Building TMDBKit XCFramework for iOS, iPadOS, tvOS, and macOS...${NC}"

# Clean previous builds
echo -e "${BLUE}Cleaning previous builds...${NC}"
rm -rf build

# Create build directory
mkdir -p build

# Array to store successfully built archives
declare -a BUILT_ARCHIVES=()
declare -a BUILT_PLATFORMS=()
declare -a FAILED_PLATFORMS=()

# Function to build for a platform
build_platform() {
    local platform_name=$1
    local archive_name=$2
    local destination=$3

    echo -e "${BLUE}Building for ${platform_name}...${NC}"

    if xcodebuild archive \
        -project TMDBKit.xcodeproj \
        -scheme TMDBKit \
        -destination "${destination}" \
        -archivePath "build/${archive_name}" \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        > /dev/null 2>&1; then

        # Check if framework actually exists
        if [ -d "build/${archive_name}.xcarchive/Products/Library/Frameworks/TMDBKit.framework" ]; then
            echo -e "${GREEN}✓ ${platform_name} build succeeded${NC}"
            BUILT_ARCHIVES+=("-archive" "build/${archive_name}.xcarchive" "-framework" "TMDBKit.framework")
            BUILT_PLATFORMS+=("${platform_name}")
            return 0
        else
            echo -e "${YELLOW}⚠ ${platform_name} build completed but framework not found${NC}"
            FAILED_PLATFORMS+=("${platform_name}")
            return 1
        fi
    else
        echo -e "${RED}✗ ${platform_name} build failed${NC}"
        FAILED_PLATFORMS+=("${platform_name}")
        return 1
    fi
}

# Build for each platform (continue even if some fail)
build_platform "iOS Device" "TMDBKit-iOS" "generic/platform=iOS"
build_platform "iOS Simulator" "TMDBKit-iOS-Simulator" "generic/platform=iOS Simulator"
build_platform "tvOS Device" "TMDBKit-tvOS" "generic/platform=tvOS"
build_platform "tvOS Simulator" "TMDBKit-tvOS-Simulator" "generic/platform=tvOS Simulator"
build_platform "macOS" "TMDBKit-macOS" "generic/platform=macOS"

# Check if we have at least one successful build
if [ ${#BUILT_ARCHIVES[@]} -eq 0 ]; then
    echo ""
    echo -e "${RED}✗ Error: No platforms were built successfully${NC}"
    exit 1
fi

# Create XCFramework with only successfully built archives
echo ""
echo -e "${BLUE}Creating XCFramework with successfully built platforms...${NC}"
xcodebuild -create-xcframework \
    "${BUILT_ARCHIVES[@]}" \
    -output build/TMDBKit.xcframework

echo ""
echo -e "${GREEN}✓ XCFramework created successfully!${NC}"
echo -e "${GREEN}Location: build/TMDBKit.xcframework${NC}"
echo ""

# Show build summary
if [ ${#BUILT_PLATFORMS[@]} -gt 0 ]; then
    echo -e "${GREEN}Successfully built platforms:${NC}"
    for platform in "${BUILT_PLATFORMS[@]}"; do
        echo -e "  ${GREEN}✓${NC} ${platform}"
    done
    echo ""
fi

if [ ${#FAILED_PLATFORMS[@]} -gt 0 ]; then
    echo -e "${YELLOW}Failed/Skipped platforms:${NC}"
    for platform in "${FAILED_PLATFORMS[@]}"; do
        echo -e "  ${RED}✗${NC} ${platform}"
    done
    echo ""
fi

echo -e "${GREEN}You can now drag this into your test project!${NC}"
