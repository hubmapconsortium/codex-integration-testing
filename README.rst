HuBMAP CODEX pipeline integration testing
=========================================

This repository hosts a simple integration testing framework for the HuBMAP
TC-CMU CODEX pipeline. "Simple" means a small shell script and three Git
submodules, for testing three CWL workflows in sequence:

#. Stitching + Cytokit
#. SPRM
#. Archiving symbolic links for the HuBMAP UI

These steps could be wrapped in an outer CWL workflow, but a shell script
more closely matches how these workflows are executed through Airflow.
