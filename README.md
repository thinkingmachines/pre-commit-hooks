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
  rev: master
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

### JavaScript

```yaml
  - id: prettier-standard
```

## Contributing

To contribute, simply clone this repository:

```
$ git clone git@github.com:thinkingmachines/coding-style.git
```

and create a new branch. We would appreciate suggestions for new pre-commit
hooks to enforce or a review of our current hooks.

## License

MIT License (c) 2019 Thinking Machines Data Science
