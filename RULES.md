# Rules
To properly comply with our requirements and assist in future
automation techniques you **MUST** satisfy the following design rules.

>   In the following the terms **must**, **must not** and **should** should be
    interpreted according to best practices, as described in [RFC-2119].

## Repository design rules

Repositories...

1.  **Must** be [created] using this template repository 
2.  **Must** root the source code (implementation) in the `source` directory
3.  **Should** place format support documentation in the project `README.md`
4.  **Must** be named `<type>-format-support`, where _type_ is a
    symbolic reference of the type of dataset you're supporting (i.e `sdf`)
5.  **Must** produce public images on Docker Hub that can be accessed using
    the reference `<owner>/<type>-format-support:<tag>`
6.  **Must** be buildable using a `Dockerfile` in the root of the project
7.  **Must** support the production of an image using the tag `stable`
8.  **Should** support the production of image tags for `latest`
    and individual [Semantic Versioning 2] tags like `1.0.0`
9.  **Must** support being built using the command `docker build .`
    from the project root, without additional parameters
10. **Must** contain at least one test dataset that can be processed
    successfully
11. **Must** store test data that can be processed successfully in
    a sub-directory of `test/success`, i.e. `test/success/1/good.data`
12. **Should** contain at least one test dataset file that cannot be processed
    successfully (i.e. an error-handling test)
13. **Must** store test data that cannot be processed successfully in
    a sub-directory of `test/failure`, i.e. `test/failure/1/bad.data`

>   Read test/README.md for a discussion of the test directory structure
    and example test execution commands that you are expected to be
    able to support

## Image behaviour rules

Images...

1.  **Must** expect to be executed using an arbitrary user and group ID.
    You cannot expect to run as a privileged user
2.  **Must** expect a volume mounted into it using the path `/dataset`
3.  **Must** expect to find the _read-only_ dataset for processing in
    `/dataset/input`
4.  **Must not** expect to be able to write to `/dataset/input`
5.  **Should** process the input dataset into files in `/dataset/output`
6.  **Must** place the implementation into the directory `/home/formatter`
    and set that directory as the image `WORKDIR`
7.  **Should** write diagnostic failure (textual) information
    to `/dataset/output/error.txt` upon failure
8.  **Should** expect to be limited to no more than 1 CPU core
9.  **Should** expect to be limited to no more than 1GiB of memory.
    Importantly, exceeding the memory limit will result in the container
    being terminated

---

[created]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[rfc-2119]: https://tools.ietf.org/html/rfc2119
[semantic versioning 2]: https://semver.org
