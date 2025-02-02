#!/bin/bash

# This script demonstrates how to fix the race condition
# using file locking

files=("/tmp/file1.txt" "/tmp/file2.txt" "/tmp/file3.txt")

for file in "${files[@]}"; do
  # Create a file
  touch "$file"
  # Acquire an exclusive lock on the file
  flock -x "$file" || { echo "Could not acquire lock on $file"; continue; }
  # Simulate some processing
  sleep 1
  # Process the file (now it's safe from concurrent access)
  cat "$file"
  # Release the lock and remove the file
  flock -u "$file"
  rm -f "$file"
done