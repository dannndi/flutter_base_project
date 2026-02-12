#!/bin/bash

echo "🚀 Starting Flutter AAB build..."

# Stop if error
set -e

echo "🔧 Building AppBundle (Release Mode)..."

flutter build appbundle \
--release \
--tree-shake-icons \
--obfuscate \
--split-debug-info=build/debug-info \
--dart-define-from-file=config.json

echo "✅ Build finished!"
echo "📁 Output:"
echo "build/app/outputs/bundle/release/app-release.aab"