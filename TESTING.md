# Testing
You must provide at lease one subdirectory in `test/success`,
and a dataset file in it's `input` directory that your formatter can process
successfully. The template's `dummy.txt` file in `test/success/1` illustrates
the expected file structure

Remember, to allow for future automated testing, each test dataset
should be in a separate `input` directory, and you must have at least one
successful test and (probably) some failure tests: -

-   `test/success/1/input/<dataset file>`
-   `test/failure/1/input/<dataset file>`

Doing this means your test data can be easily be applied to your container
for functional testing using the `docker-compose.yaml` file provided.

You'll need docker-compose - ideally from within a Python virtual
environment: -

    $ python -m venv ~/.venv/format-support
    $ source ~/.venv/format-support/bin/activate

    $ pip install --upgrade pip
    $ pip install -r build-requirements.txt

Build your formatter image using `docker-compose`: -

    $ IMAGE_NAME=${PWD##*/} docker-compose build

>   Ignore the warning about the IMAGE_TEST variable not being set

Then, simulating the provision of the format output directory that would
normally be created by the DataTier Manager, you can run a specific test.
Here we run test **1**...

    $ export IMAGE_TEST=1
    $ mkdir -p test/success/${IMAGE_TEST}/output
    $ IMAGE_NAME=${PWD##*/} docker-compose up
