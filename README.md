# Validate Configs Github Action

:octocat: Github Action to validate your config files using the [config-file-validator](https://github.com/Boeing/config-file-validator). The config-file-validator will recursively scan the provided search path for the following configuration file types:

* Apple PList XML
* CSV
* ENV
* HCL
* HOCON
* INI
* JSON
* Properties
* TOML
* XML
* YAML



Each file will get validated for the correct syntax and the results collected into a report showing the path of the file and if it is invalid or valid. If the file is invalid an error will be displayed along with the line number and column where the error ocurred. By default the `$GITHUB_WORKDIR` is scanned.

![Standard Run](./img/standard_run.png)

## Inputs

| Input              | Required | Default Value | Description |
| ------------------ | -------- | ------------- | ----------- |
| search-paths       | false    | `"."`         | The path that will be recursively searched for configuration files |
| exclude-dirs       | false    | `""`          | A comma-separated list of subdirectories to exclude from validation |
| exclude-file-types | false    | `""`          | A comma-separated list of file extensions to exclude. Possible values are `xml`, `ini`, `yaml`, `yml`, `toml`, and `json` |
| depth              | false    | `""`          | An integer value limiting the depth of recursion for the search paths. For example, setting depth to 0 would disable recursion |
| reporter           | false    | `"standard"`  | Format of the report printed to stdout. Options are `standard` and `json` |
| group-by           | false    | `""`          | Group output by filetype, directory, pass-fail |


## Outputs

N/A

## Example usage

### Standard Run

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
```

### Custom search path

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
        with:
            search-path: ./project/configs
```

### Multiple search paths

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
        with:
            search-path: ./project/configs ./project/devops
```

### Exclude a directory

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
        with:
            exclude-dirs: "tests,vendor"
```

### Exclude file type

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
        with:
            exclude-file-types: "json,xml"
```

### Disable recursive scanning

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
        with:
            depth: 0
```

### JSON Report

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
        with:
            reporter: "json"
```

### Group By Pass/Fail

```yml
jobs:
  validate-config-files:
    runs-on: ubuntu-latest
    steps:
      - uses: kehoe/validate-configs-action@v3
        with:
            reporter: "json"
```

