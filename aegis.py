import jinja2 
import itertools
import subprocess as sp
import os
import random


class Exam():
    '''
    Exam (class): tools to generate exams with random exercises.

    Methods
    -------
    load_template : load template
    '''                                                                  

    def __init__(self):
        """Initialize an instance of class Exam.

        This class is used to generate many exams from a batch of
        exercises.
        """
        self.items = []
        self.subitems = []

    def load_template(self, template_file):
        """Load a template.
        """
                 
        a = template_file.split('/')
        template_dir = '/'.join(a[:-1]) + '/'
        if len(template_dir) == 1:
            template_dir = './'
        template_filename = a[-1]
        templateLoader = jinja2.FileSystemLoader(searchpath=template_dir)

        latex_jinja_env = jinja2.Environment(block_start_string=r"\BLOCK{",
                                             block_end_string='}',
                                             variable_start_string=r'\VAR{',
                                             variable_end_string='}',
                                             comment_start_string=r'\#{',
                                             comment_end_string='}',
                                             line_statement_prefix='%%',
                                             line_comment_prefix='%#',
                                             trim_blocks=True,
                                             autoescape=False,
                                             loader=templateLoader)

        # Make LaTeX file
        template = latex_jinja_env.get_template(template_filename)
        self.template = template
         

    def load_items(self, idir, items, subitems):
        """Load exercises to compile exams.
        """

        exs = []
        k = -1
        for e in items:
            exs.append([])
            k += 1
            for v in subitems[k]:
                se = str(e).zfill(2)
                sv = str(v).zfill(2)
                fname = f"{idir}/e{se}_v{sv}.tex"
                with open(fname) as f:
                    txt = f.read()
                exs[k].append(txt)

        self.exs = exs

    def generate(self, N=0, output_dir='./',
                 shuffle=True, all_permutations=False,
                 makepdfs=False):
        """Generate exams suffling and randomly chosing items.

        Parameters
        ----------
        N : int (optional)
            The number of exams to generate.  If N is greater than the
            number of iterations, some exams will be repeated (by the
            Pigeon-hole theorem.)

        shuffle : boolean (optional)
            Shuffle the versions of the exercises to generate random
            versions of the exams.

        all_permutations : boolean (optional)
            Generate the complete list of possible combinations of the
            versions of the exercises.

        Returns
        --------

        """
        if os.path.isdir(output_dir):
            msg = f"Saving PDF files in {output_dir}."
        else:
            try:
                os.makedirs(output_dir)
            except Exception:
                msg = (f"Directory {output_dir} does not exist and "
                       f"can not be created.")
                print(msg)
                
        r = []
        nv = []
        for e in self.exs:
            i = len(e)
            r.append(range(i))
            nv.append(i)
        r = tuple(r)

        nn = 1
        for n in nv:
            nn = nn * n
        Ntot = nn

        it = itertools.product(*r)        

        if shuffle:

            if N == 0:
                N = Ntot

            comb = []
            for x in it:
                comb.append(x)

            for c in range(N):
                ch = random.sample(range(Ntot), 1)[0]
                versions = list(comb[ch])
                exs = []
                for j, k in enumerate(versions):
                    exs.append(self.exs[j][k])

                texname = 'parcial_' + str(c+1).zfill(4) + '.tex'
                texfile = '/'.join([output_dir, texname])
                print(f'Generando parcial en archivo {texfile}')
        
                target = open(texfile, 'w')
                target.write(self.template.render(exs=exs))
                target.close()

                if makepdfs:
                    os.popen(f'cp famaf.cls {output_dir}/') 
                    os.popen(f'cp logo_famaf.png {output_dir}/') 

                    cmd = ['pdflatex', '-interaction', 'nonstopmode', texname]
                    print(cmd)
                    source_dir = os.getcwd()
                    os.chdir(output_dir)  
                    for _ in range(3):
                        proc = sp.Popen(cmd, stdout=sp.PIPE)
                        proc.communicate()
                    os.chdir(source_dir)  

        if all_permutations:

            for c, v in enumerate(it):

                exs = []
                for i, k in enumerate(list(v)):
                    exs.append(self.exs[i][k])

                texname = 'parcial_' + str(c+1).zfill(4) + '.tex'
                texfile = '/'.join([output_dir, texname])
                print(f'Generando parcial en archivo {texfile}')
        
                target = open(texfile, 'w')
                target.write(self.template.render(exs=exs))
                target.close()

                if makepdfs:
                    source_dir = os.getcwd()
                    os.chdir(output_dir)  
                    cmd = ['pdflatex', '-interaction', 'nonstopmode', texname]
                    for _ in range(3):
                        proc = sp.Popen(cmd, stdout=sp.PIPE)
                        proc.communicate()

                    os.chdir(source_dir) 
