# Rules
To properly comply with our requirements and assist in future
automation techniques you **MUST** satisfy the following design rules.

>   In the following the terms **must**, **must not** and **should** should be
    interpreted according to best practices, as described in [RFC-2119].

## Repository design rules

Repositories...

1.  **Must** be [created] using this template repository 
2.  **Must** be named `<type>-format-support`, where _type_ is a
    symbolic reference of the type of dataset you're supporting (i.e `sdf`)
3.  **Must** produce images on Docker Hub that can be accessed using
    the image `<owner>/<type>-format-support:<tag>`
4.  **Must** be buildable using a `Dockerfile` in the root of the project
5.  **Must** support the production of an image using the tag `stable`
6.  **Should** support the production of image tags for `latest`
    and individual [Semantic Versioning 2] tags like `1.0.0`
7.  **Must** support being built using the command `docker build .`
    from the project root
8.  **Must** contain at least one test dataset file that can be processed
    successfully
9.  **Must** store test data that can be processed successfully in
    a sub-directory of `test/success`, i.e. `test/success/1/good.data`
10. **Should** contain at least one test dataset file that cannot be processed
    successfully (i.e. an error-handling test)
11. **Must** store test data that cannot be processed successfully in
    a sub-directory of `test/failure`, i.e. `test/failure/1/bad.data`

## Image behaviour rules

Images...

1.  **Must** expect to be executed using an arbitrary user ID.
    You cannot expect to run as a privileged user
2.  **Must** expect a volume mounted into it using the path `/dataset`
3.  **Must** expect to find _read-only_ data for processing in `/dataset/input`
4.  **Must not** expect to be able to write to `/dataset/input`
5.  **Must** write the word `SUCCESS` upon successful completion,
    or the word `FAILURE` when it encounters an error,
    to the file `/dev/termination-log`. When the image completes,
    if this file does not exist or does not contain the word `SUCCESS`
    the conversion will be treated as a failure
6.  **Must** only write the words `SUCCESS` or `FAILURE`
    to the file `/dev/termination-log`
7.  **Must** place implementation into the directory `/home/formatter`
    and set that as the image `WORKDIR`
8.  **Must** stop with an [exit-code] of `0` (OK), even on failure
9.  **Must** expect to restart after a failure. Although the container won't
    actively be restarted by the DataTier Manager a container may be restarted
    by the underlying Kubernetes framework because it's exceeded its allocated
    memory or has not honoured point 6
10. **Should** write diagnostic (textual) information
    to the file `/dataset/output/failure.txt` upon failure
11. **Should** process the input dataset into files in `/dataset/output`
12. **Should** expect to be limited to no more than 1 CPU core
13. **Should** expect to be limited to no more than 1GiB of memory.
    Importantly, exceeding the memory limit will result in the container
    being terminated

---

[created]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[exit-code]: https://en.wikipedia.org/wiki/Exit_status
[semantic versioning 2]: https://semver.org
[rfc-2119]: https://tools.ietf.org/html/rfc2119
