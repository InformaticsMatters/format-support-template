# Rules
To properly comply with our requirements and assist in future
automation techniques you **MUST** satisfy the following design rules.

>   In the following the terms **must** and **should** should be
    interpreted according to best practices, as described in [RFC-2119].

## Repository design rules

Repositories...

1.  **Must** be [created] using this template repository 
2.  **Must** be named `<type>-format-support`, where _type_ is a
    symbolic reference of the type of dataset you're supporting (i.e `sdf`)
3.  **Must** produce images on Docker Hub that can be accessed using
    the image `<owner>/<type>-format-support:<tag>`
4.  **Must** support the production of image using the tag `stable`
5.  **Should** support the production of image tags for `latest`
    and individual [Semantic Versioning 2] tags like `1.0.0`
6.  **Should** have at least one test dataset file
7.  **Should** store test data in `test/datasets`

## Image behaviour rules

Images...

1.  **Must** expect to be executed using an arbitrary user ID.
    You cannot expect to run as a privileged user
2.  **Must** expect a volume mounted into it using the path `/dataset`
3.  **Must** expect to find _read-only_ data for processing in `/dataset/input`
4.  **Must** write the word `SUCCESS` upon successful completion,
    or the word `FAILURE` when it encounters an error,
    to the file `/dev/termination-log`. When the image completes,
    if this file does not exist or does not contain the word `SUCCESS`
    the conversion will be treated as a failure
5.  **Must** only write the words `SUCCESS` or `FAILURE`
    to the file `/dev/termination-log`
6.  **Must** stop with an [exit-code] of `0` (OK), even on failure
7.  **Must** expect to restart after a failure. Although the container won't
    actively be restarted by the DataTier Manager a container may be restarted
    by the underlying Kubernetes framework because it's exceeded its allocated
    memory or has not honoured point 6
8.  **Should** write diagnostic (textual) information
    to the file `/dataset/output/failure.txt` upon failure
9.  **Should** process the input dataset into files in `/dataset/output`
10. **Should** expect to be limited to no more than 1 CPU core
11. **Should** expect to be limited to no more than 1GiB of memory.
    Importantly, exceeding the memory limit will result in the container
    being terminated

---

[created]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[exit-code]: https://en.wikipedia.org/wiki/Exit_status
[semantic versioning 2]: https://semver.org
[rfc-2119]: https://tools.ietf.org/html/rfc2119
