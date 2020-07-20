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
 
