import aegis

X = aegis.Exam()
X.load_template('template.tex')

items_dir = 'exercises'
items = [1, 2, 3, 4]
subitems = [[1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4], [1, 2, 3, 4], [1, 2, 3, 4]]

X.load_items(items_dir, items, subitems)

# files must be named eXX_vYY.tex, where XX and YY are correlative numbers.
# e.g., e01_v02.tex

X.generate(N=4, output_dir='exams', makepdfs=False)
X.gen_excell(output_dir='exams/')
