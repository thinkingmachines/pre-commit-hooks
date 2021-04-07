# Thinking Machines Coding Style

We use [pre-commit](https://pre-commit.com) to enforce uniform coding style for everyone
in Thinking Machines.

## Installation

First, install pre-commit into your system. It is highly encourage you use python 3.6 or above

```sh
$ pip install --upgrade pip
$ pip install pre-commit
```

Ensure that pre-commit has been installed correctly:

```sh
$ pre-commit --version
```

## Usage

Create a `.pre-commit-config.yaml` file in your repo's root with the following contents
depending on the language you are using.

### Python

```yaml
repos:
  - repo: https://github.com/psf/black
    rev: 20.8b1
    hooks:
      - id: black
        language_version: python3
  - repo: https://github.com/PyCQA/flake8
    rev: 3.8.4
    hooks:
      - id: flake8
  - repo: https://github.com/PyCQA/isort
    rev: 5.6.4
    hooks:
      - id: isort
        args: ["--profile", "black"]
```

The default flake8 configuration conflicts black. A simple configuration that
works can be found in [`.flake8`](.flake8). Copy it to the root of your repo
to get these hooks working together.

#### Notebook specific hooks

You can add notebook specific hooks by using the following.

```yaml
  - repo: https://github.com/tomcatling/black-nb
    rev: 0.3.0
    hooks:
      - id: black-nb
  - repo: https://github.com/s-weigand/flake8-nb
    rev: v0.2.5
    hooks:
      - id: flake8-nb
```

Similar to previous hooks, you can copy [`.flake8_nb`](.flake8_nb) to the
root of your repo to get these hooks working together.

### JavaScript

We use `prettier` for base coding style tweaked with some
[standard](https://standardjs.com/)-ish configuration:
[`.prettierrc`](.prettierrc).

```yaml
repos:
  - repo: https://github.com/prettier/prettier
    rev: 2.1.2
    hooks:
      - id: prettier
        files: (?i)\.(json|js|jsx|ts|tsx)$
```

Use `eslint` for project specific conventions. A starting configuration can
be found in [`.eslintrc`](.eslintrc). Copy it to the root of your repo and
add `additional_dependencies` to the `.pre-commit-config.yaml` file as necessary.

```yaml
repos:
  - repo: https://github.com/pre-commit/mirrors-eslint
    rev: v7.12.1
    hooks:
      - id: eslint
        files: (?i)\.(js|jsx|ts|tsx)$
        additional_dependencies:
          - 'eslint@7.12.1'
          - 'eslint-config-prettier@6.15.0'
```

Refer to the [ui-starter](https://github.com/thinkingmachines/ui-starter)
template for React configurations.

## Setting Github Actions

You can set up Github Action to check new pull requests follow the coding
style by creating a `.github/workflows/pre-commit.yaml` file in your repo's
root with the following content:

```yaml
name: pre-commit

on:
  pull_request:
  push:
    branches: [master]

jobs:
  pre-commit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: actions/setup-python@v1
      - uses: pre-commit/action@v2.0.0
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
```

## Contributing and Developing

To contribute, simply clone this repository:

```sh
$ git clone git@github.com:thinkingmachines/coding-style.git
```

and create a new branch. We would appreciate suggestions for new pre-commit
hooks to enforce or a review of our current recommended hooks and
configuration.

## License

MIT License (c) 2020 Thinking Machines Data Science
