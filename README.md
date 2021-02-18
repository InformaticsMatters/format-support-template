# format-support-template

![build](https://github.com/InformaticsMatters/format-support-template/workflows/build/badge.svg)
![build latest](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20latest/badge.svg)
![build tag](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20tag/badge.svg)
![build stable](https://github.com/InformaticsMatters/format-support-template/workflows/publish%20stable/badge.svg)

![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/informaticsmatters/format-support-template)

>   Replace the following template text with your own documentation

A template repository for **DataTier dataset format-support implementations**.

Use this repository to start development of a container image that can be
used by the DataTier Manager to support the loading of a dataset _type_.

You are required to preserve and adhere to the design rules
that can be found in this repository's `RULES.md`. 

Replace the `InformaticsMatters/format-support-template` value in the
above badge links with the name of your own repository.

The built-in GitHub Action workflows generate docker images.
If your docker repository name does not mirror your
GitHub repository name then you will need to adjust these actions.
For example, if you create a GitHub repository from this one and call it
'XYZ/my-support-template' then you must be able to push docker images
called 'xyz/my-support-template:latest', or you will need to edit the
workflow files to satisfy your needs.

---
