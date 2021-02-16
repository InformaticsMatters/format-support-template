# format-support-template

![build](https://github.com/InformaticsMatters/format-support-template/workflows/build/badge.svg)
![build latest](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20latest/badge.svg)
![build tag](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20tag/badge.svg)
![build stable](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20stable/badge.svg)

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/informaticsmatters/format-support-template)

>   Replace the following template text with your own documentation

>   Replace the `InformaticsMatters/format-support-template` value in the
    above badge links with the name of your own repository.

>   The GitHub Action workflows generate docker images.
    If your docker repository name does not mirror your
    GitHub repository name then you will need to adjust these actions.
    For example, if you create a GitHub repository from this one and call it
    'XYZ/my-support-template' then you must be able to push docker images
    called 'xyz/my-support-template:latest', or you will need to edit the
    workflow files to satisfy your needs.

A template repository for DataTier **dataset** format-support implementations.

Use this repository to start development of a container image that can be
used by the DataTier Manager to support the loading of a dataset _type_.

To properly comply with our requirements and assist in future
automation techniques you **MUST** satisfy the following design rules: -

In the following the terms **must** and **should** should be
interpreted according to best practices, as described in [RFC-2119].

## Repository design rules

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

1.  **Must** expect to be executed using an arbitrary user ID.
    You cannot expect to run as a privileged user
2.  **Must** expect a volume mounted into it using the path `/dataset`
3.  **Must** expect to find data for processing in `/dataset/input`
4.  **Must** write the word `SUCCESS` upon successful completion,
    or the word `FAILURE` when it encounters an error,
    to the file `/dev/termination-log`. When the image completes,
    if this file does not exist or does not contain the word `SUCCESS`
    the conversion will be treated as a failure
5.  **Must** only write the words `SUCCESS` or `FAILURE`
    to the file `/dev/termination-log`
6.  **Must** stop with an [exit-code] of `0` (OK), even on failure
7.  **Should** write diagnostic (textual) information
    to the file `/dataset/output/failure.txt` upon failure
8.  **Should** process the input dataset into files in `/dataset/output`

---

[created]: https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[exit-code]: https://en.wikipedia.org/wiki/Exit_status
[semantic versioning 2]: https://semver.org
[rfc-2119]: https://tools.ietf.org/html/rfc2119
