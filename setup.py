from setuptools import setup

requirements = [
    "black==19.10b0",
    "flake8==3.7.9",
    "isort==4.3.21",
]

if __name__ == "__main__":
    setup(
        name="tm-coding-style",
        description="Thinking Machines Coding Style",
        install_requires=requirements,
    )
