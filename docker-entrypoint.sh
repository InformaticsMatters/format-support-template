#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# The DataTier Dataset 'format support' container entrypoint.
#
# Keep this header block as a rule reminder.
#
#   Rules
#   -----
# - Your container wil be launched as a Kubernetes Job
# - Your user ID wil be automatically assigned
# - You will not have root access to the filesystem
# - The (read-only) dataset files to format will be in '/dataset/input'
# - You must deposit formatted files in '/dataset/output'
# - Your container must leave using an exit code of 0 (even if there's an error)
# - You must write the word `SUCCESS` upon successful completion,
#   or the word `FAILURE` when it encounters an error,
#   to the file `/dev/termination-log`.
# - You can use `/dataset/output/failure.txt` to store diagnostic
#   failure information.
# -----------------------------------------------------------------------------

# Now format your data...

echo "Write me!" > /dataset/output/failure.txt

echo "FAILURE" > /dev/termination-log
