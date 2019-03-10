from setuptools import setup

requirements = [
    "black",
    "isort",
]

if __name__ == "__main__":
    setup(
        name="coding-style",
        version="0.0.1",
        description="Thinking Machines Coding Style",
        install_requires=requirements,
    )
