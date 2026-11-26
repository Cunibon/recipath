#!/usr/bin/env bash
set -euo pipefail

SQLITE_YEAR=2026
SQLITE_VERSION=3540100
SQLITE_ZIP_SHA256=0a9c8e34352dad46006aa82836d5383bff9dc6bc9ce5a60553c05aa30e6ad1f9

SQLITE_DIR=third_party/sqlite
SQLITE_NAME="sqlite-amalgamation-${SQLITE_VERSION}"

cd "$(dirname "$0")/.."

work_dir="$(mktemp -d)"
trap 'rm -rf "$work_dir"' EXIT

curl -fsSL -o "$work_dir/sqlite.zip" \
  "https://sqlite.org/${SQLITE_YEAR}/${SQLITE_NAME}.zip"

if command -v sha256sum >/dev/null; then
  actual_sha256="$(sha256sum "$work_dir/sqlite.zip" | cut -d' ' -f1)"
else
  actual_sha256="$(shasum -a 256 "$work_dir/sqlite.zip" | cut -d' ' -f1)"
fi

if [ "$actual_sha256" != "$SQLITE_ZIP_SHA256" ]; then
  echo "sqlite checksum mismatch: expected $SQLITE_ZIP_SHA256, got $actual_sha256" >&2
  exit 1
fi

unzip -q "$work_dir/sqlite.zip" "${SQLITE_NAME}/sqlite3.c" -d "$work_dir"
mkdir -p "$SQLITE_DIR"
cp "$work_dir/${SQLITE_NAME}/sqlite3.c" "$SQLITE_DIR/sqlite3.c"

grep -v -E '^  purchases(_ui)?_flutter:' pubspec.yaml > "$work_dir/pubspec.yaml"
cp "$work_dir/pubspec.yaml" pubspec.yaml

awk '/^  purchases(_ui)?_flutter:$/{skip=1;next} skip&&/^  [^ ]|^[^ ]/{skip=0} !skip' pubspec.lock > "$work_dir/pubspec.lock"
cp "$work_dir/pubspec.lock" pubspec.lock

manifest=android/app/src/main/AndroidManifest.xml
grep -v 'com.android.vending.BILLING' "$manifest" > "$work_dir/AndroidManifest.xml"
cp "$work_dir/AndroidManifest.xml" "$manifest"

gradle=android/app/build.gradle.kts
sed 's/signingConfigs.getByName("debug")/null/' "$gradle" > "$work_dir/build.gradle.kts"
cp "$work_dir/build.gradle.kts" "$gradle"

if ! grep -q '^hooks:' pubspec.yaml; then
  cat >> pubspec.yaml <<EOF

hooks:
  user_defines:
    sqlite3:
      source:
        android: source
      path: ${SQLITE_DIR}/sqlite3.c
EOF
fi
