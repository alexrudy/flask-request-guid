build: clean
    python3 -m build

upload INDEX='pypi': build
    python3 -m twine upload --repository {{INDEX}} dist/*

clean:
    rm -rf dist/*

check-install INDEX='pypi.org':
    #!/usr/bin/env bash
    set -eo pipefail
    rm -rf .installvenv/
    python3 -m venv .installvenv
    source .installvenv/bin/activate
    python3 -m pip install -i https://{{INDEX}}/simple/ flask-request-guid
    python3 -c 'import flask_request_guid; print(f"{flask_request_guid.__version__=}")'
