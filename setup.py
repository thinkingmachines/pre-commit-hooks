from setuptools import setup

with open("requirements.txt") as requirements_file:
    requirements = requirements_file.read().split("\n")

if __name__ == "__main__":
    setup(
        name="tm-coding-style",
        description="Thinking Machines Coding Style",
        install_requires=requirements,
    )
