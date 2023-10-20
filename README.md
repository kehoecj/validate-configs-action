# Validate Configs Github Action

:octocat: Github Action to validate your config files using the [config-file-validator](https://github.com/Boeing/config-file-validator). The config-file-validator will recursively scan the provided search path for the following configuration file types:

* XML
* JSON
* YAML
* TOML
* INI

Each file will get validated for the correct syntax and the results collected into a report showing the path of the file and if it is invalid or valid. If the file is invalid an error will be displayed along with the line number and column where the error ocurred. By default the `$GITHUB_WORKDIR` is scanned.

![Standard Run](./img/standard_run.png)

## Inputs

| Input              | Required | Default Value | Description |
| ------------------ | -------- | ------------- | ----------- |
| search-path        | false    | `.`         | The path that will be recursively searched for configuration files |
| exclude-dirs       | false    | ` `          | A comma-separated list of subdirectories to exclude from validation |
| exclude-file-types | false    | ` `          | A comma-separated list of file extensions to exclude. Possible values are `xml`, `ini`, `yaml`, `yml`, `toml`, and `json` |
| reporter           | false    | `standard`   | Format of the report printed to stdout. Options are `standard` and `json` |


## Outputs

N/A

## Example usage

### Standard Run

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v2
```

### Custom Search Path

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v2
        with:
            search-path: ./project/configs
```

### Exclude a directory

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v2
        with:
            exclude-dirs: "tests,vendor"
```

### Exclude file type

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v2
        with:
            exclude-file-types: "json,xml"
```

### JSON Report

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v2
        with:
            reporter: "json"
```
