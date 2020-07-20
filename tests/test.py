from aegis import aegis
import shutil
import pytest
import pathlib
import os
PATH = pathlib.Path(os.path.abspath(os.path.dirname(__file__)))

TEST_DIR = 'test_exams' 

def gen_dir_name():
    import secrets
    import string
    ALPHABET = string.ascii_letters + string.digits
    new_dir = ''.join(secrets.choice(ALPHABET) for i in range(10))
    return new_dir

def test_instantiate_01():
    E = aegis.Exam()
    assert isinstance(E, aegis.Exam)

def test_examples_01():
    problems, versions = aegis.gen_examples()
    assert len(problems) == len(versions)

def test_examples_02():
    # Generate a random name for a directory:
    new_dir = gen_dir_name()
    problems, versions = aegis.gen_examples(dir_exams=new_dir)
    shutil.rmtree(new_dir)
    assert len(problems) == len(versions)
 
def test_examples_03():
    new_dir = gen_dir_name()
    problems, versions = aegis.gen_examples(dir_exams=new_dir)
    # call gen_examples again, dir already exists
    problems, versions = aegis.gen_examples(dir_exams=new_dir)
    shutil.rmtree(new_dir)

def test_template_01():
    X = aegis.Exam()
    X.load_template('non_existent_file.tex')

def test_load_01():
    X = aegis.Exam()
    items_dir = TEST_DIR
    problems, versions = aegis.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
 
def test_generate_01():
    X = aegis.Exam()
    items_dir = TEST_DIR
    problems, versions = aegis.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
#    X.load_template('template.tex')
#    X.generate(N=4, output_dir='exams', makepdfs=False)
#
#def test_generate_02():
#    X = aegis.Exam()
#    items_dir = TEST_DIR
#    problems, versions = aegis.gen_examples(dir_exams=items_dir)
#    X.load_items(items_dir, problems, versions)
#    X.load_template('template.tex')
#    X.generate(N=0, output_dir='exams', makepdfs=False)
# 
#def test_generate_03():
#    X = aegis.Exam()
#    items_dir = TEST_DIR
#    problems, versions = aegis.gen_examples(dir_exams=items_dir)
#    X.load_items(items_dir, problems, versions)
#    X.load_template('template.tex')
#    X.generate(N=1, output_dir='exams', makepdfs=True)
#
#def test_cleanup():
#    shutil.rmtree(TEST_DIR)
 

# print(problems)
# print(versions)
# 
# X = aegis.Exam()
# X.load_template('template.tex')
# 
# items_dir = 'exams'
# items = problems
# subitems = versions
# 
# X.load_items(items_dir, items, subitems)
#  
# X.generate(N=4, output_dir='exams', makepdfs=True)
# # X.gen_excell(output_dir='exams/')             
#                  
