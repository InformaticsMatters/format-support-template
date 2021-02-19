# Rules

>   In this text the terms **must**, **must not** and **should** should be
    interpreted according to best practices, as described in [RFC-2119].

To properly comply with our requirements and assist in future
automation techniques you **must** satisfy the following design rules.

>   In order to provide a formatter that is 'approved' by Informatics Matters
    we may introduce automated background testing and inspection of your
    repository files, and the images you publish by inspecting this repository,
    your test data and Docker Hub. We may also introduce our own automated
    build of your images.

>   Deviating from the rules laid out in this file may result in your formatter
    being removed from the Data Tier Manager format library.

## Repository design rules

Repositories...

1.  **Must** not remove or edit the files `RULES.md` or `VERSION.txt`,
    these files are excluded from the MIT license and must remain,
    unaltered
2.  **Must** be [created] using this template repository 
3.  **Must** root any and all source code (implementation) in
    the `source` directory
4.  **Should** place format support documentation in the project `README.md`
5.  **Must** be named `<type>-format-support`, where _type_ is a
    symbolic reference of the type of dataset you're supporting (i.e `sdf`)
6.  **Must** produce public images on Docker Hub that can be accessed using
    the reference `<owner>/<type>-format-support:<tag>`
7.  **Must** be buildable using a `Dockerfile` in the root of the project
8.  **Must** support the production of an image using the tag `stable`
9.  **Should** support the production of image tags for `latest`
    and individual [Semantic Versioning 2] tags like `1.0.0`
10. **Must** support being built using the command `docker build .`
    from the project root, without additional parameters
11. **Must** contain at least one test dataset that can be processed
    successfully
12. **Must** store test data that can be processed successfully in
    a sub-directory of `test/success`, i.e. `test/success/1/good.data`
13. **Should** contain at least one test dataset file that cannot be processed
    successfully (i.e. an error-handling test)
14. **Must** store test data that cannot be processed successfully in
    a sub-directory of `test/failure`, i.e. `test/failure/1/bad.data`
15. **Must** provide `build`, `build latest`, `build tag` and `build stable`
    badges on a single line, in format provided in the top of the current
    `README.md`
16. **Must** provide a `tag` badge, on its own line, in format provided
    in the top of the current `README.md`
 
>   Read test/README.md for a discussion of the test directory structure
    and example test execution commands that you are expected to be
    able to support

## Image behaviour rules

Images...

1.  **Must** be published to Docker Hub
2.  **Should** use `docker-entrypoint.sh` as their container entrypoint
3.  **Must** use `CMD` and not `ENTRYPOINT` to launch the entrypoint script  
4.  **Must** expect to be executed using an arbitrary user and group ID.
    Your container cannot expect to run as a privileged user
5.  **Must** expect the environment variable `DT_DATASET_ID` to be set
    to a string representing the identity of the dataset provided
6.  **Must** expect a volume mounted into it using the path `/dataset`
7.  **Must** expect to find the _read-only_ dataset file for processing in
    `/dataset/input`
8.  **Must not** expect to be able to write to `/dataset/input`
9.  **Should** process the input dataset into files in `/dataset/output`
10. **Must** place the implementation into the directory `/home/formatter`
    and set that directory as the image `WORKDIR`
11. **Should** write diagnostic failure (textual) information
    to `/dataset/output/error.txt` upon failure
12. **Should** expect to be limited to no more than 1 CPU core
13. **Should** expect to be limited to no more than 1GiB of memory.
    Importantly, exceeding the memory limit will result in the container
    being terminated

---

[created]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[rfc-2119]: https://tools.ietf.org/html/rfc2119
[semantic versioning 2]: https://semver.org
