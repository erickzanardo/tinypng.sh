# tinypng.sh

This is a very simple bash scripts that makes easier for you to use the API from https://tinypng.com/ to compress your images.

To run this you need to have only `curl` and `jq` installed.

## Usage

You will need to apply for an API KEY on https://tinypng.com (free tier avaialable) and export a variable with the name `TINYPNG_KEY` on your environment.

```
$ tinypng.sh ImagePath.png
```
