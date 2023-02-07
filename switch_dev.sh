# Script directory
BASEDIR=$(dirname "$0")

# Remove GoogleService-Info.plist from ios project because it won't be recreate
rm -f "$BASEDIR/ios/Runner/GoogleService-Info.plist"

# Switch firebase project
flutterfire configure --project="dev-swap-e9baf" --platforms="android,ios" -y

# Change getter devMode value to true
sed -i '' 's/return false; \/\/ COMMAND\-DEBUG/return true; \/\/ COMMAND\-DEBUG/g' "$BASEDIR/lib/app/utils/helpers.dart"

# Clean
flutter clean


#-------------
#Get Signing Report
#./gradlew signingreport
