.PHONY: test clean

VENV_PYTHON ?= python3

repl: env
	. env/bin/activate; ipython

clean:
	$(VENV_PYTHON) setup.py clean
	find . -type f -name "*.pyc" -exec rm {} \;

purge: clean
	rm -rf env dist build *.egg-info

env: env/bin/activate

env/bin/activate: setup.py
	test -d env || virtualenv -p $(VENV_PYTHON) --no-site-packages env
	. env/bin/activate ; pip install -U pip wheel
	. env/bin/activate ; pip install -r requirements.txt
	touch env/bin/activate
