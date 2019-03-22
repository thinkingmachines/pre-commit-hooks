from setuptools import setup

requirements = [
    "black",
    "flake8",
    "isort",
]

if __name__ == "__main__":
    setup(
        name="tm-coding-style",
        version="0.0.1",
        description="Thinking Machines Coding Style",
        install_requires=requirements,
    )
