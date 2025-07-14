# Set mason template
dart pub global activate mason_cli
mason get
echo "✅ Mason template set"

# Rename application name 
dart pub global activate rename
echo "Enter your application name:"
read name
rename setAppName --targets android,ios --value "$name"

# Rename app bundle
echo "Enter your org (e.g. com.example.company):"
read org
rename setBundleId --targets android,ios --value "$org"
echo "✅ Bundle Id set to $org"

# Convert org (e.g. com.example.app) to path (com/example/app)
package_path=$(echo "$org" | tr '.' '/')

# Get current MainActivity path (default from flutter create)
default_path="android/app/src/main/kotlin"
current_path=$(find $default_path -name "MainActivity.kt" -exec dirname {} \;)

# Moving MainActivity.kt to new path
# Skip if the new path is already correct
if [ "$current_path" != "$default_path/$package_path" ]; then
  echo "📦 Moving MainActivity.kt from:"
  echo "    $current_path to $default_path/$package_path"

  # Create new package path
  mkdir -p "$default_path/$package_path"

  # Move MainActivity.kt
  mv "$current_path/MainActivity.kt" "$default_path/$package_path/MainActivity.kt"

  # Update package line inside MainActivity.kt
  sed -i '' "s/^package .*/package $org/" "$default_path/$package_path/MainActivity.kt"

  # Delete old empty folders
  find "$default_path" -type d -empty -delete

  echo "✅ Package moved to $org"
else
  echo "ℹ️ Package already correct. Skipping move."
fi