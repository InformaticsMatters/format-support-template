# Testing
You must one subdirectory in `test/success`, and a dataset file in it's `input`
directory that your formatter can process successfully. The template's
`dummy.txt` file in `test/success/1` illustrates the expected file structure.

Remember, to allow for possible future automated testing, each test dataset
should be in a separate `input` directory, and you must have at least one
successful test and (ideally) some failure tests: -

-   `test/success/1/input/<dataset file>`
-   `test/failure/1/input/<dataset file>`

Following this structure means your test data can be easily applied to your
container for functional testing using the `docker-compose.yaml` file provided.

You'll need to have installed `docker-compose` - ideally from within a
Python virtual environment: -

    $ python -m venv ~/.venv/format-support
    $ source ~/.venv/format-support/bin/activate

    $ pip install --upgrade pip
    $ pip install -r build-requirements.txt

...before building your formatter image using `docker-compose`: -

    $ IMAGE_NAME=${PWD##*/} docker-compose build

...and then, simulating the provision of the output directory that would
normally be created by the DataTier Manager, we can run a specific test...

Here we apply our test/success/**1** dataset to the container...

    $ export TEST_TYPE=success
    $ export TEST_DIR=1
    $ export DATASET_FILENAME=dummy.txt
    $ export DATASET_EXTRA_VARIABLES="x=1"
    $ mkdir -p test/${TEST_TYPE}/${TEST_DIR}/output
    $ IMAGE_NAME=${PWD##*/} docker-compose up

Or we can run tests based on files in the failure branch of the test tree
with...

    $ export TEST_TYPE=failure
    $ export TEST_DIR=1
    $ export DATASET_FILENAME=dummy.txt
    $ export DATASET_EXTRA_VARIABLES="x=1"
    $ mkdir -p test/${TEST_TYPE}/${TEST_DIR}/output
    $ IMAGE_NAME=${PWD##*/} docker-compose up
