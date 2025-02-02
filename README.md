# Shell Script Race Condition

This repository demonstrates a race condition in a simple shell script that processes a list of files.  The script creates, processes, and removes files. However, if multiple processes run the script concurrently, race conditions can occur, potentially leading to unexpected file access or modification issues.  The solution demonstrates how to address this race condition using file locks.

## Bug Description
The `bug.sh` script has a race condition because it does not handle concurrent access to the files it creates and modifies.  The `cat` command may fail if the file is modified or deleted after the file is created but before the `cat` command executes.

## Solution
The `bugSolution.sh` script addresses the race condition by using file locking to ensure exclusive access to the files.  Only one process can access the file at a time, preventing concurrent modification.