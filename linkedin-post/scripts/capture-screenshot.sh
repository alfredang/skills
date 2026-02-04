#!/bin/bash
# Capture screenshot of a website for LinkedIn post
# Usage: ./capture-screenshot.sh <URL> [output-filename]

URL=$1
OUTPUT=${2:-"linkedin-screenshot.png"}

if [ -z "$URL" ]; then
    echo "Usage: ./capture-screenshot.sh <URL> [output-filename]"
    echo "Example: ./capture-screenshot.sh https://myapp.netlify.app screenshot.png"
    exit 1
fi

echo "📸 Capturing screenshot of $URL..."

# Try puppeteer first (most common)
if command -v npx &> /dev/null; then
    echo "Using Puppeteer..."
    npx --yes puppeteer screenshot "$URL" --output "$OUTPUT" --viewport 1200x630
    if [ $? -eq 0 ]; then
        echo "✅ Screenshot saved to $OUTPUT"
        exit 0
    fi
fi

# Try shot-scraper (Python)
if command -v shot-scraper &> /dev/null; then
    echo "Using shot-scraper..."
    shot-scraper "$URL" -o "$OUTPUT" --width 1200 --height 630
    if [ $? -eq 0 ]; then
        echo "✅ Screenshot saved to $OUTPUT"
        exit 0
    fi
fi

# Fallback to screenshot API
echo "Using screenshot API..."
curl -s "https://api.screenshotone.com/take?url=$URL&viewport_width=1200&viewport_height=630&format=png&access_key=free" -o "$OUTPUT"

if [ -f "$OUTPUT" ]; then
    echo "✅ Screenshot saved to $OUTPUT"
else
    echo "❌ Failed to capture screenshot"
    exit 1
fi
