build:
    python3 -m build

upload INDEX='pypi': build
    python3 -m twine upload --repository {{INDEX}} dist/*

clean:
    rm -rf dist/*
