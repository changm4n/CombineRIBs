#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/CombineRIBs'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy CombineRIBs file templates into the local CombineRIBs template directory
xcodeTemplate () {
  echo "==> Copying up CombineRIBs Xcode file templates..."

  if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    rm -R "$XCODE_TEMPLATE_DIR"
  fi
  mkdir -p "$XCODE_TEMPLATE_DIR"

  cp -R $SCRIPT_DIR/*.xctemplate "$XCODE_TEMPLATE_DIR"
  cp -R $SCRIPT_DIR/CombineRIB.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/CombineRIB.xctemplate/ownsViewwithXIB/"
  cp -R $SCRIPT_DIR/CombineRIB.xctemplate/ownsView/* "$XCODE_TEMPLATE_DIR/CombineRIB.xctemplate/ownsViewwithStoryboard/"
}

xcodeTemplate

echo "==> ... success!"
echo "==> CombineRIBs have been set up. In Xcode, select 'New File...' to use CombineRIBs templates."
