*****************
Installation
*****************

Downloading AEGIS
===============================

The package can be installed either 
`from source <https://github.com/mlares/aegis>`_
or 
`from the pypi reposository <http://www.pypi.org>`_.

AEGIS is publically available from a GitHub repository.
It can be downloaded or cloned with::

    git clone https://github.com/mlares/aegis.git

The code can be explored using GitHub, including development activity and documentation.  

Requirements
================

AEGIS generates and compile Latex documents, so it need a working
installation of Latex in the system.
 

Installing AEGIS
===============================

Once the virtualenvironment has been set (recommended), then install the required packages::

    pip install -r requirements.txt

It is convenient to save the root directory of the installation.  
In bash, for example,::

   export aegis_rootdir="$(pwd)"


AEGIS module can be used anywhere provided the following command 
is executed within the environment in the directory $aegis_rootdir::

    pip install .

Alternatively, it can be installed via the `python package index <aegis>`_::

    pip install aegis_latex  

Testing
===============================

For testing purposes, an utility is provided in the
:meth:``aegis.Exam.gen_examples`` method.

.. code:: python

    X.gen_examples(N_problems=4, N_versions=[3, 3, 3, 3],
                   dir_tex='dir_tex/', dir_pdf='dir_pdf/')

This will create two directories, and fill them with TEX and PDF
files.  Each tex file contains a short message indicating the problem
and version numbers.

.. code:: python

   import aegis

   problems, versions = aegis.gen_examples(dir_tex='exams', dir_pdf='exams')

   print(problems)
   print(versions)

   X = aegis.Exam()
   X.load_template('template.tex')

   items_dir = 'exams'
   items = problems
   subitems = versions

   X.load_items(items_dir, items, subitems)
    
   X.generate(N=4, output_dir='exams', makepdfs=True)
   # X.gen_excell(output_dir='exams/')             
    
More tests can be found at ``tests/test.py``.




