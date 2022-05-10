class Funcionario:
    def __init__(self, nome):
        self.nome = nome

    def resitra_horas(self, horas):
        print(f'Horas registradas...')

    def mostra_tarefas(self):
        print(f'Fez muita coisa...')

class Caelum(Funcionario):
    def mostra_tarefas(self):
        print('Fez muita coisa, Caelumer')

    def busca_cursos_do_mes(self, mes=None):
        print(f'Mostrando cursos - {mes}' if mes else 'Mostrando cursos desse mês')

class Alura(Funcionario):
    def mostra_tarefas(self):
        print('Fez muita coisa, Alurete!')

    def busca_perguntdas_sem_resposta(self):
        print('Mostrando perguntas não respondidas do fórum')

class Hipster: # CLASSE MIXIN #
    def __str__(self):
        return f'Hipster, {self.nome}'
    """"
        Compartilha um comportamento que não é o mais importante de uma CLASSE
        A idéia é não ter que instância nenhum objeto dessa classe
    """

class Junior(Alura, Hipster):
    pass

 # Múltiplas Classes #
class Pleno(Alura, Caelum, Hipster):
    pass

class Senior(Alura, Caelum, Hipster):
    pass
jose = Junior('José')
print(jose)
jose.busca_perguntdas_sem_resposta()

raul = Pleno('Raul')
print(raul)
raul.mostra_tarefas()
raul.busca_perguntdas_sem_resposta()


luan = Senior('luan')
print(luan)
luan.busca_perguntdas_sem_resposta()
luan.busca_cursos_do_mes()
luan.mostra_tarefas()