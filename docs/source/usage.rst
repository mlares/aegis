*****************
API usage
*****************

This tools can be used as an API, from a python prompt or from a command line.

Some tasks that can be performed with the provided utilities include:

- Compile an exam from a chosen set of exercises
- Shuffle a set of versions of exercises to make a given number of
  different exams
- Obtain all possible combinations of exercise versions to compile
  exams
- Compile a complete set of exercises
- Generate filenames to be filled with text of exercises
- Generate documents that involve lists of text items (using the same
  model of an exam)
- Produce an excell file with the selected versions of the exercises.


Minimal example
=====================

The generation of the exams require three steps:

- load a latex template
- load the versions of the exercises
- generate the final latex files for the exams

For example, the code below uses a template file named
``parcial_1.tex``, and loads the sources to compile exams
with three exercises.  
Exercise 1 has three versions, 
exercise 2 has four versions, and 
exercise 3 has two versions.

The N option in :meth:`~aegis.aegis.Exam.generate` allows to produce N exams.

.. code:: python

   import aegis
   X = aegis.Exam()
   X.load_template('parcial_1.tex')

   items_dir = 'exercises'
   items = [1, 2, 3]
   subitems = [[1, 2, 3], [1, 2, 3, 4], [1, 2]]

   X.load_items(items_dir, items, subitems)
   X.generate(N=4, output_dir='exams')


Optional parameters
=======================

Optional parameters can be used to generate exams in different ways.
All optional parameters are described in the documentation of the
methods.  The most relevat options are:

**Randomly combine exercise versions:**
    In the :meth:`~aegis.aegis.Exam.generate`  method, use the
    ``shuffle=True`` option.

**Compile PDF files:**
    In the :meth:`~aegis.aegis.Exam.generate`  method, use the
    ``makepdfs=True`` option.

**Generate an Excell file with the summary of exercise versions:**
    Call the :meth:`~aegis.aegis.Exam.gen_excell`  method


Format for latex files
=======================================

The default format for latex files is ``e01_v01.tex``.  The method
:meth:`~aegis.aegis.Exam.gen_examples` produces example files with this format::

    X = aegis.Exam()
    X.gen_examples()

It is possible to change the default behaviour with the method 
:py:meth:`~aegis.aegis.Exam.name_pattern`.  For example, in order to use a suite
of exercises of the form:

- problem_001-version_01.tex
- problem_001-version_02.tex
- problem_001-version_03.tex
- etc

we can call the function as follows:

.. code:: python

    X = aegis.Exam()
    X.name_pattern('problem_', 'version_', '-', 3, 2)






Excell file with the list of versions
=======================================

.. code:: python

    X.gen_excell()





