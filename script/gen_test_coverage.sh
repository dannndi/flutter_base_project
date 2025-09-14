#!/bin/bash

# Exit if any command fails
set -e

# Run flutter tests with coverage
echo "▶️ Running Flutter tests with coverage..."
flutter test --coverage

# Filter generated file so not included in test coverage
echo "▶️ Filter excluded files..."
lcov --remove coverage/lcov.info \
  'lib/core/l10n/generated/app_localizations.dart' \
  'lib/core/l10n/generated/app_localizations_en.dart' \
  'lib/core/l10n/generated/app_localizations_id.dart' \
  -o coverage/lcov_filtered.info

# Generate HTML report using lcov/genhtml
echo "▶️ Generating HTML coverage report..."
genhtml coverage/lcov_filtered.info -o coverage/html

# Open in default browser (macOS/Linux/Windows detection)
if [[ "$OSTYPE" == "darwin"* ]]; then
  open coverage/html/index.html
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  xdg-open coverage/html/index.html
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
  start coverage/html/index.html
else
  echo "✅ Coverage report generated at coverage/html/index.html"
  echo "⚠️ Could not auto-open browser on this OS."
fi