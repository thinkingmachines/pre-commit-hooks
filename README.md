# TM Coding Style

We use [pre-commit](https://pre-commit.com) to enforce uniform coding style for everyone
in Thinking Machines.

## Usage

Create a `.pre-commit-config.yaml` file in your repo's root with the following contents
depending on the language you are using.

### Python

```yaml
repos:
-   repo: https://github.com/thinkingmachines/coding-style
    rev: master
    hooks:
    - id: black
```

### JavaScript

```yaml
repos:
-   repo: https://github.com/thinkingmachines/coding-style
    rev: master
    hooks:
    - id: prettier-standard
```
