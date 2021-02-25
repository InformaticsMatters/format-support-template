# Format support event reporting
Format containers can report status messages back to the data tier, which will
make them available via thr REST API, using a _one-line-per-event_ text file.
The name of the event file that is used is provided to the
container using the environment variable `DT_EVENT_FILE`. This file will not
exit when the container starts, and it is the responsibility of the
format-support container to create it and write to it.

The file does not have to be used.

## File format
The file is text with each line representing an individual event: -

    <timstamp> # <event type> <message>

Where: -

-   `timestamp` is any string that can be processed by v2.8.x of the Python
    [python-dateutil] module
-   `event type` is one of a standard set of recognised Python logging [levels]
-   `message` is any short message, that will be truncated to 79 characters

Lines found in the file that do not match this format will be ignored.

## Examples
The following lines all represent valid events in an event file: -

-   `2021-02-25T12:23:00.123456Z # INFO 400 of 25,000 molecules`
-   `Sat Oct 11 17:13:46 UTC 2003 # WARNING No molecules`

---

[python-dateutil]: https://pypi.org/project/python-dateutil/
[levels]: https://docs.python.org/3/library/logging.html#logging-levels
