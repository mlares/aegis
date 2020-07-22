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
    X = aegis.Exam()
    problems, versions = X.gen_examples()
    assert len(problems) == len(versions)
    shutil.rmtree('exams')

def test_examples_02():
    # Generate a random name for a directory:
    new_dir = gen_dir_name()
    X = aegis.Exam()
    problems, versions = X.gen_examples(dir_exams=new_dir)
    shutil.rmtree(new_dir)
    assert len(problems) == len(versions)
 
def test_examples_03():
    new_dir = gen_dir_name()
    X = aegis.Exam()
    problems, versions = X.gen_examples(dir_exams=new_dir)
    # call gen_examples again, dir already exists
    problems, versions = X.gen_examples(dir_exams=new_dir)
    shutil.rmtree(new_dir)

def test_examples_04():
    X = aegis.Exam()
    problems, versions = X.gen_examples(dir_exams=11)
    shutil.rmtree('exams')

def test_template_01():
    X = aegis.Exam()
    X.load_template('non_existent_file.tex')

def test_load_01():
    X = aegis.Exam()
    items_dir = TEST_DIR
    problems, versions = X.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
 
def test_generate_01():
    X = aegis.Exam()
    items_dir = TEST_DIR
    problems, versions = X.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
    X.load_template('../latex/template.tex')
    X.generate(N=4, output_dir='exams', makepdfs=False)

def test_generate_03():
    X = aegis.Exam()
    items_dir = TEST_DIR
    problems, versions = X.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
    X.load_template('../latex/template.tex')
    X.generate(N=0, output_dir='exams', makepdfs=False)
 
##def test_generate_04():
##    X = aegis.Exam()
##    items_dir = TEST_DIR
##    problems, versions = X.gen_examples(dir_exams=items_dir)
##    X.load_items(items_dir, problems, versions)
##    X.load_template('../latex/template.tex')
##    X.generate(N=1, output_dir='exams', makepdfs=True)
#
##def test_generate_05():
##    X = aegis.Exam()
##    items_dir = TEST_DIR
##    problems, versions = X.gen_examples(dir_exams=items_dir)
##    X.load_items(items_dir, problems, versions)
##    X.load_template('../latex/template.tex')
##    X.generate(N=0, output_dir='exams', makepdfs=True)
#                   
def test_generate_06():
    X = aegis.Exam()
    items_dir = TEST_DIR
    problems, versions = X.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
    X.load_template('../latex/template.tex')
    X.generate(N=1, output_dir='exams', makepdfs=False)
    X.gen_excell(output_dir='exams/')             
    os.remove("exams_versions.xlsx")

                   
def test_generate_07():
    X = aegis.Exam()
    items_dir = gen_dir_name()
    problems, versions = X.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
    X.load_template('../latex/template.tex')
    output_dir = gen_dir_name()
    X.generate(N=1, output_dir=output_dir, makepdfs=False)
    shutil.rmtree(items_dir)
    shutil.rmtree(output_dir)
                                         
def test_generate_08():
    # generate ( gen_excell
    X = aegis.Exam()
    problems, versions = X.gen_examples(dir_exams=TEST_DIR)
    X.load_items(TEST_DIR, problems, versions)
    X.load_template('../latex/template.tex')
    X.generate(N=1, output_dir=TEST_DIR, makepdfs=False)
    X.gen_excell(output_dir=TEST_DIR)
    os.remove("exams_versions.xlsx")

def test_generate_09():
    # generate ( all_permutations
    X = aegis.Exam()
    problems, versions = X.gen_examples(dir_exams=TEST_DIR)
    X.load_items(TEST_DIR, problems, versions)
    X.load_template('../latex/template.tex')
    X.generate(all_permutations=True, output_dir=TEST_DIR,
               makepdfs=False)
    X.gen_excell(output_dir=TEST_DIR)
    os.remove("exams_versions.xlsx")

def test_generate_10():
    # generate ( all_permutations
    X = aegis.Exam()
    problems, versions = X.gen_examples(dir_exams=TEST_DIR)
    X.load_items(TEST_DIR, problems, versions)
    X.load_template('../latex/template.tex')
    N = 2
    res = X.generate(N=N, output_dir=TEST_DIR,
               makepdfs=False, interactive=True)
    assert len(res) == N
 
def test_generate_11():
    X = aegis.Exam()
    items_dir = TEST_DIR
    problems, versions = X.gen_examples(dir_exams=items_dir)
    X.load_items(items_dir, problems, versions)
    X.load_template('../latex/template.tex')
    X.generate(N=4, output_dir=42, makepdfs=False)     

def test_cleanup():
    shutil.rmtree(TEST_DIR)
    if os.path.isdir('exams'):
        shutil.rmtree('exams')
 
#coverage run -m pytest test.py
#coverage report -m
#coverage html
