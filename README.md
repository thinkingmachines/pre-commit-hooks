# Thinking Machines Coding Style

We use [pre-commit](https://pre-commit.com) to enforce uniform coding style for everyone
in Thinking Machines.

## Installation

First, install pre-commit into your system

```
$ pip install pre-commit
```

Ensure that pre-commit has been installed correctly:

```
$ pre-commit --version
```

## Usage

Create a `.pre-commit-config.yaml` file in your repo's root with the following contents
depending on the language you are using.

```yaml
repos:
- repo: https://github.com/thinkingmachines/coding-style
  rev: 2020.03.23
  hooks: ...
```

Add hooks depending on the languages you are using.

## Available hooks

### Python

```yaml
  - id: black
  - id: flake8
  - id: isort
```

These 3 hooks default configuration conflict with each other. A simple configuration that works can be
found in `config/`. Copy `config/.isort.cfg` and `config/.flake8` to the root of your repo to get
these hooks working together.
### JavaScript

```yaml
  - id: prettier-standard
  - id: eslint
```

### Go

```yaml
  - id: gofmt
```

## Setting Github Actions

You can set up Github Action to check new pull requests follow the coding style by
creating a `.github/workflows/pre-commit.yaml` file in your repo's root with the following content:
```
name: pre-commit-checks
on: [pull_request]
jobs:
  pre-commit-checks:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Set up Python
        uses: actions/setup-python@v1
        with:
          python-version: 3.6
      - name: Install dependencies
        run: python -m pip install --upgrade pre-commit
      - name: Cache pre-commit
        uses: actions/cache@v1
        with:
          path: ~/.cache/pre-commit
          key: pre-commit-1|${{ hashFiles('.pre-commit-config.yaml') }}
      - name: Run Pre-commit
        run: pre-commit run --all-files --source origin/master --origin HEAD
```

The code snippet can also be found [here](https://github.com/thinkingmachines/gh-actions/blob/master/.github/workflows/pre-commit.yaml)


## Contributing and Developing

To contribute, simply clone this repository:

```
$ git clone git@github.com:thinkingmachines/coding-style.git
```

and create a new branch. We would appreciate suggestions for new pre-commit
hooks to enforce or a review of our current hooks.

You can test a new or existing hooks on an repo or file using the following command:
```
pre-commit try-repo --verbose <PATH TO CODING-STYLE> <HOOK ID>  --files <FILE>
# Using black
pre-commit try-repo --verbose ../coding-style black --files main.py
```

## License

MIT License (c) 2020 Thinking Machines Data Science
