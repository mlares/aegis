import jinja2
import os
import subprocess as sp

from itertools import product

# ______________________________________________________________________
# 1. Cargar ejercicios

# Leer los archivos de problemas
# asume 4 ejercicios con 4 versiones para cada uno

ej = []
for i in range(4):
    ej.append([])
    for j in range(4):
        fname = f"e{i+1}_v{j+1}.tex"
        with open(fname) as f:
            txt = f.read()
        ej[i].append(txt)


# ______________________________________________________________________
# 2. Configurar template

source_dir = './'
report_dir = './'
template_file = 'template_parcial_1.tex'
templateLoader = jinja2.FileSystemLoader(searchpath=report_dir)

latex_jinja_env = jinja2.Environment(
    block_start_string=r"\BLOCK{",
    block_end_string='}',
    variable_start_string=r'\VAR{',
    variable_end_string='}',
    comment_start_string=r'\#{',
    comment_end_string='}',
    line_statement_prefix='%%',
    line_comment_prefix='%#',
    trim_blocks=True,
    autoescape=False,
    loader=templateLoader
)

# Make LaTeX file

template_intro = latex_jinja_env.get_template(template_file)

# ______________________________________________________________________
# 3. Hacer parciales

# Hay dos opciones: todas las combinaciones posibles
#                   o sorteos random

# En esta version hacemos todas las combinaciones posibles

it = list(product(range(4), range(4), range(4), range(4)))

range_min = 0
range_max = len(it)
range_max = 2

for c, i in enumerate(it[range_min:range_max]):

    exs = []
    for i, k in enumerate(list(i)):
        exs.append(ej[i][k])

    texname = 'parcial_' + str(c+1).zfill(4) + '.tex'
    print(f'Generando parcial en archivo {texname}')

    filename = os.path.join(report_dir, texname)
    target = open(filename, 'w')
    target.write(template_intro.render(exs=exs))
    target.close()

    cmd = ['pdflatex', '-interaction', 'nonstopmode', texname]
    for _ in range(3):
        proc = sp.Popen(cmd, stdout=sp.PIPE)
        proc.communicate()

    os.chdir(source_dir)



