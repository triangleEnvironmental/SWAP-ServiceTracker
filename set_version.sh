### Set version number

# ./set_version.sh 1.0.0
# ./set_version.sh 1.0.0 increase

version=$1
increase_build_number=$2
BASEDIR=$(dirname "$0")

# Pubspec
sed -r -i '' "s/^version: *[0-9]+\.[0-9]+\.[0-9]+/version: $version/g" "$BASEDIR/pubspec.yaml"

# AppStrings
sed -r -i '' "s/static const version = \"[0-9]+\.[0-9]+\.[0-9]+\";/static const version = \"$version\";/g" "$BASEDIR/lib/app/constants/strings.dart"

# iOS
sed -r -i '' "s/MARKETING_VERSION = [0-9]+\.[0-9]+\.[0-9]+;/MARKETING_VERSION = $version;/g" "$BASEDIR/ios/Runner.xcodeproj/project.pbxproj"

# Increase build number for android
if [ "$increase_build_number" = "increase" ]; then
  "$BASEDIR/set_build_increase.sh"
fi

