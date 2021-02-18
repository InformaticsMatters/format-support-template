#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# The DataTier Dataset 'format support' container entrypoint.
# -----------------------------------------------------------------------------
# Refer to RULES.md for comprehensive format support rules,
# summarised below...
#
# 1. A volume will be mounted at '/dataset'
# 2. There will be files in '/dataset/input' that you can read
# 3. There will be a '/dataset/output' directory where you can write
# 4. Before leaving you must write 'SUCCESS' or 'FAILURE'
#    to '/dev/termination-log'
# 5. If you write 'FAILURE', consider putting additional helpful messages
#    into '/dataset/output/failure.txt'
# -----------------------------------------------------------------------------

# Replace this text
# and following with your formatter implementation...

# Now format your data...
echo "Hello World!"

# ...always writing SUCCESS or FAILURE to /dev/termination-log
# and, before leaving, optional further context to /dataset/output/failure.txt
echo "Write me!" > /dataset/output/failure.txt
echo "FAILURE" > /dev/termination-log
