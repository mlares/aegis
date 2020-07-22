.. DOCS
.. image:: https://readthedocs.org/projects/aegis/badge/?version=latest
:target: https://aegis.readthedocs.io/en/latest/?badge=latest
:alt: Documentation Status

.. BUILD
.. image:: https://travis-ci.org/mlares/aegis.svg?branch=master
    :target: https://travis-ci.org/mlares/aegis


AEGIS / *Academic Exam Generator for Interchange and Shuffe*

This package offers tools to compose exams from a pool of exercises.
It can be used to produce a one-time exam from a set of chosen exercises,
or to produce a large number of different exams about a topic, with a similar
level of difficulty.  This can be usefull, for example, for take-home exams, where the sharing of exams among students is possible.

It requires a system with Latex and a pool of exercises written on separated
Latex files.

Example:

Supose we have to make different exams, comprising 3 problems.  We have several versions of the problems, with a similar difficulty, in the ``midterm_exam_01``
directory:

::

    MyCourse
    ├── syllabus.txt
    ├── bibliography
    ├── midterm_exam_01
    │   ├── problem01_version01.tex
    │   ├── problem01_version02.tex
    │   ├── problem01_version03.tex
    │   ├── problem02_version01.tex
    │   ├── problem02_version02.tex
    │   ├── problem03_version01.tex
    │   ├── problem03_version02.tex
    │   └── bboxinout.py
    └── notes

It is possible to make 12 different exams using the different versions of the exercises.  AEGIS allows to read the exercises and combine them in a template latex file to make a set of exams.


Requirements
------------

AEGIS generates and compile Latex documents, so it need a working
installation of Latex in the system.

Autor
-----

Project by Marcelo Lares (IATE, UNC).  Developed in 2020.
