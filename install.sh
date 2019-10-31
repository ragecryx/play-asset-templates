#!/bin/bash

INKSCAPE_USER_DIR=$HOME/.config/inkscape


# Resolve current & script path
CURRENT_PATH=`pwd`

SCRIPT_PATH="`dirname \"$0\"`"
SCRIPT_PATH="`( cd \"$SCRIPT_PATH\" && pwd )`"  # absolutized and normalized
if [ -z "$SCRIPT_PATH" ] ; then
  echo "Cannot access the directory where '$0' resides. Exiting..."
  exit 1
fi


# Check if Inkscape is installed
if ! [ -x "$(command -v inkscape)" ]; then
  echo 'Error: Inkscape is not installed.' >&2
  exit 1
fi


# Check for templates dir existance
if [ ! -d $INKSCAPE_USER_DIR/templates ]; then
    mkdir -p $INKSCAPE_USER_DIR/templates
fi

cp -R $CURRENT_PATH/*.svg $INKSCAPE_USER_DIR/templates
