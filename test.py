import aegis


def instantiate_01():
    E = aegis.Exam()
    assert isinstance(E, aegis.Exam)
