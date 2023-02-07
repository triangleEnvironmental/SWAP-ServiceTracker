### Increase build number in pubspec.yaml

# ./set_build_increase.sh

BASEDIR=$(dirname "$0")

build=`sed -r -n 's/^version:.+\+([0-9]+)/\1/p' "$BASEDIR/pubspec.yaml"`
build=$(($build + 1))
sed -r -i '' "s/(^version:.+\+).+/\1$build/g" "$BASEDIR/pubspec.yaml"
