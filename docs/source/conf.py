# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
import pathlib
# sys.path.insert(0, os.path.abspath('../../aegis/'))
# src_paths = [ '../../aegis/']

CURRENT_PATH = pathlib.Path(os.path.abspath(os.path.dirname(__file__)))
AEGIS_PATH = CURRENT_PATH.parent.parent
sys.path.insert(0, str(AEGIS_PATH))

from aegis import aegis


# -- Project information -----------------------------------------------------

project = 'aegis'
copyright = '2020, Marcelo Lares'
author = 'Marcelo Lares'

# The full version, including alpha/beta/rc tags
with open(AEGIS_PATH / "aegis" / "__init__.py") as fp:
    VERSION = [
        l for l in fp.readlines() if l.startswith("__version__")
    ][0].split("=", 1)[-1].strip().replace('"', "")
release = VERSION

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
# sphinx.ext.napoleon: to make numpy docs style
# sphinxcontrib.bibtex: to cite papers with latex
extensions = [
        'sphinx.ext.autodoc',
        'sphinx.ext.napoleon',
        'sphinxcontrib.bibtex'
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

source_suffix = '.rst'

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'alabaster'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = []

# for readthedocs:
master_doc = 'index'
