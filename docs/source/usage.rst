*****************
API usage
*****************

This tools can be used as an API, from a python prompt or from a command line.


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

The N option in :meth:`aegis.Exam.generate` allows to produce N exams.

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
    In the :meth:``aegis.Exam.generate``  method, use the
    ``shuffle=True`` option.

**Compile PDF files:**
    In the :meth:``aegis.Exam.generate``  method, use the
    ``makepdfs=True`` option.

**Generate an Excell file with the summary of exercise versions:**
    Call the :meth:``aegis.Exam.gen_excell``  method







