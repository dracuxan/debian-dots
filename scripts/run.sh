#!/bin/bash

FILE_PATH=$1
shift     # Remove the file path from the list of arguments
ARGS="$@" # Capture any additional arguments

# Ensure a file path is provided
if [[ -z "$FILE_PATH" ]]; then
    echo "Usage: $0 <source_file> [program arguments if any]"
    exit 1
fi

EXT="${FILE_PATH##*.}"
FILE_NAME=$(basename "$FILE_PATH" ."$EXT")

case "$EXT" in
c)
    echo "Compiling ${FILE_NAME}.c..."
    # Ensure 'bin' directory exists for compiled binaries
    mkdir -p "bin"
    gcc -Wall -Wextra -lm "$FILE_PATH" -o "bin/${FILE_NAME}"
    if [[ $? -ne 0 ]]; then
        echo "Compilation failed."
        exit 1
    fi
    echo "Running bin/${FILE_NAME}..."
    ./bin/${FILE_NAME} $ARGS
    ;;
py)
    echo "Running ${FILE_NAME}.py with Python..."
    python3 "$FILE_PATH" $ARGS
    ;;
go)
    echo "Compiling ${FILE_NAME}.go..."
    # Ensure 'bin' directory exists for compiled binaries
    mkdir -p "bin"
    go build -o "bin/${FILE_NAME}" "$FILE_PATH"
    if [[ $? -ne 0 ]]; then
        echo "Compilation failed."
        exit 1
    fi
    echo "Running bin/${FILE_NAME}..."
    ./bin/${FILE_NAME} $ARGS
    ;;
*)
    echo "Unsupported file type: .$EXT"
    exit 1
    ;;
esac

exit 0
