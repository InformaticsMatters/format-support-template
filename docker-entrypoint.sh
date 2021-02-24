#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# The DataTier Dataset 'format support' container entrypoint.
# -----------------------------------------------------------------------------
# Refer to RULES.md for comprehensive format support rules,
# summarised below...
#
# 1. A volume will be mounted at '/dataset'
# 2. The dataset file will be in '/dataset/input'
# 3. There will be a '/dataset/output' directory where you are expected
#    to write your formatted Dataset files
# 4. The environment variable `DT_DATASET_NAME` will be set to
#    a string value representing the name given to the dataset
# 5. The environment variable `DT_DATASET_FILE` will be set to
#    the full path and file of the dataset file to be processed
# 6. If you encounter an error you should put a helpful (human-readable)
#    diagnostic message into the file identified by the environment variable
#    `DT_ERROR_TEXT_FILE`
# -----------------------------------------------------------------------------

# Replace this text and the remainder of the file
# with your formatter implementation...

# Format your data...
echo "Hello World!"

# Here we simulate an error with a non-zero exit code.
# Upon success you would either a) not use exit or b) use 'exit 0'.
# Here we're simulating a failure...
echo "Write me!" > "${DT_ERROR_TEXT_FILE}"
exit 1
