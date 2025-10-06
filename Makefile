# Copyright (c) 2025 Tranquil Data, Inc. All rights reserved.

.SILENT:

REQUIREMENTS_FILE=requirements.txt
VENV_DIR=.venv
VENV_CONFIG=$(VENV_DIR)/pyvenv.cfg

validate: $(VENV_CONFIG)
	$(VENV_DIR)/bin/python -m openapi_spec_validator swagger.yaml

$(VENV_CONFIG): $(REQUIREMENTS_FILE)
	python3 -m venv $(VENV_DIR)
	$(VENV_DIR)/bin/python -m pip install -r $(REQUIREMENTS_FILE)

clean:
	rm -rf $(VENV_DIR) 