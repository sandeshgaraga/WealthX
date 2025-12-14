#!/bin/bash
# MoneyQuest Quick Start Script

echo "======================================"
echo "MoneyQuest - Flutter App Setup"
echo "======================================"
echo ""

# Check if flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found! Please install Flutter from: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version)"
echo ""

# Get dependencies
echo "📦 Installing dependencies..."
flutter pub get

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "======================================"
echo "Setup Complete! 🎉"
echo "======================================"
echo ""
echo "To run the app:"
echo "  flutter run"
echo ""
echo "To run on a specific device:"
echo "  flutter devices           (list available devices)"
echo "  flutter run -d <device>   (run on specific device)"
echo ""
echo "To build for release:"
echo "  flutter build apk         (Android)"
echo "  flutter build ios         (iOS)"
echo ""
