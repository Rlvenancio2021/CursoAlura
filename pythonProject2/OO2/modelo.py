class Programa:
    def __init__(self, nome, ano):
        self._nome = nome.title() # Atributos privados não são herdados para as classes filhas,
                                   # por convênção, usamos apenas um underscore
        self.ano = ano
        self._likes = 0

    @property
    def nome(self):
        return self._nome

    @nome.setter
    def nome(self, novo_nome):
        self._nome = novo_nome.title()

    @property
    def likes(self):
        return self._likes

    def dar_like(self):
        self._likes += 1

    # CLASSE HERDEIRA (SUBCLASSES) #
class Filme(Programa):
    def __init__(self, nome, ano, duracao):
        super().__init__(nome, ano) # Utilizamos o Super para chamar o inicializador da classe mãe (tbm conhecida como super)
        self.duracao = duracao

    def retorna_cadastro_diferenciado(self):
        pass

class Serie(Programa):
    def __init__(self, nome, ano, temporadas):
        super().__init__(nome, ano)
        self.temporadas = temporadas

vingadores = Filme('vingadores - guerra infinita', 2018, 160)
vingadores.dar_like()
#print(f'{vingadores.nome} - {vingadores.ano} - {vingadores.duracao} - {vingadores.likes}')

atlanta = Serie('atlanta', 2018, 2)
atlanta.dar_like()
atlanta.dar_like()
#print(f'{atlanta.nome} - {atlanta.ano} - {atlanta.temporadas} - {atlanta.likes}')

 # POLIMORFISMO #
filmes_e_serias = [vingadores, atlanta]

for programa in filmes_e_serias:
    detalhes = programa.duracao if hasattr(programa, 'duracao') else programa.temporadas # Verifica se o Objeto possui o atributo mencionado
    print(f'{programa.nome} - {detalhes} D - {programa.likes}')