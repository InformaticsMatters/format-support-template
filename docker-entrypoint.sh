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
# - If the file '/dataset/output/error.txt' exists this will be
#   interpreted as an error. The text in the file being used for diagnostic
#   information.
# - Not generating any files in '/dataset/output' is interpreted as an error
# - Your container MUST use exit code 0 (even if there's an error) to prevent
#   the DataTier (Kubernetes) re-launching your image.
# -----------------------------------------------------------------------------

# Now format your data...
echo "Hello World!" > /dataset/output/error.txt
