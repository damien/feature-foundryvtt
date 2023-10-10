
# FoundryVTT (`foundryvtt`)

Installs the [FoundryVTT](https://foundryvtt.com/) application.

## Example usage

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/damien/feature-foundryvtt/foundryvtt:latest": {
            "url": "https://foundryvtt.s3.amazonaws.com/releases/10.291/FoundryVTT-10.291.zip?AWSAccessKeyId=AKIA2KJE5YZ3BCQQ6DH3&Signature=REDACTED%3D&Expires=1684831893"
        }
    }
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| greeting | Select a pre-made greeting, or enter your own | string | hey |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/devcontainers/feature-starter/blob/main/src/hello/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
