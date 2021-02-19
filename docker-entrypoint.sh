#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# The DataTier Dataset 'format support' container entrypoint.
# -----------------------------------------------------------------------------
# Refer to RULES.md for comprehensive format support rules,
# summarised below...
#
# 1. A volume will be mounted at '/dataset'
# 2. The dataset file will be in '/dataset/input'
# 3. There will be a '/dataset/output' directory where you can write
# 4. The environment variable `DT_DATASET_ID` will be set to
#    a string value representing thw identity of the dataset
# 5. If you encounter an error you should put a helpful human-readable
#    diagnostic message into '/dataset/output/error.txt'
# -----------------------------------------------------------------------------

# Replace this text and the remainder of the file
# with your formatter implementation...

# Format your data...
echo "Hello World!"

# Simulate an error with a non-zero exit code.
# Upon success you either do not use exit or you use 'exit 0',
# here we're pretending to fail...
echo "Write me!" > /dataset/output/error.txt
exit 1
