# format-support-template

![build](https://github.com/InformaticsMatters/format-support-template/workflows/build/badge.svg)
![build latest](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20latest/badge.svg)
![build tag](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20tag/badge.svg)
![build stable](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20stable/badge.svg)

![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/InformaticsMatters/format-support-template?include_prereleases)

>   Replace the following template text with your own documentation

>   Replace the `InformaticsMatters/format-support-template` value in the
    above badge links with the name of your own repository.

>   The GitHub Action workflows generate docker images.
    if your docker repository name does not mirror your
    GitHub repository name then you will need to adjust these actions.
    For example, if you create a GitHub repository from this one and call it
    'XYZ/my-support-template' then you must be able to push docker images
    called 'xyz/my-support-template:latest' or edit the workflows.

A template repository for DataTier **dataset** format-support implementations.

Use this repository to start development of a container image that can be
used by the DataTier to support a dataset type. To assist in potential future
automated inclusion in the DataTier your repository should
be named `<type>-format-support`.

You must have a Dockerfile and your GitLab Action must produce
images on Docker Hub that can be accessed usign the reference
`docker.io/<type>-format-support:<tag>`.

You should support the production of image tags for `latest`, `stable` and
individual tags like `1.0.0`.
