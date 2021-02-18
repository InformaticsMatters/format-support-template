# Test Datasets
A directory holding reference datasets used for functional testing.

Replace the exiting test/success directories with your own datasets.

Remember, to allow for future automated testing, each test dataset
should be in a separate `input` directory, and you must have at least 1
successful test and (probably) some failure tests: -

-   `test/success/1/input/<dataset file>`
-   `test/failure/1/input/<dataset file>`

Doing this means your test data can be easily be applied to your container
for functional testing: -

    $ mkdir test/success/1/output
    $ docker run --volume=$PWD/test/success/1:/dataset \
        --memory=1g \
        --cpus=1 \
        me/mydata-format-support:stable
