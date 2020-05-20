from setuptools import setup

with open("requirements.txt") as requriements_file:
    requirements = requriements_file.read().split("\n")

if __name__ == "__main__":
    setup(
        name="tm-coding-style",
        description="Thinking Machines Coding Style",
        install_requires=requirements,
    )
