#!/bin/bash

echo "🚀 Starting Flutter APK build..."

# Stop if error
set -e

echo "🔧 Building APK (Release Mode)..."

flutter build apk \
--release \
--tree-shake-icons \
--obfuscate \
--split-debug-info=build/debug-info \
--dart-define-from-file=config.json

echo "✅ Build finished!"
echo "📁 Output:"
echo "build/app/outputs/flutter-apk/app-release.apk"