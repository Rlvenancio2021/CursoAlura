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

    # Representação Textual de Objetos #
    def __str__(self):
        return f'{self.nome} - {self.ano} - {self.likes} Likes'

    # CLASSE HERDEIRA (SUBCLASSES) #
class Filme(Programa):
    def __init__(self, nome, ano, duracao):
        super().__init__(nome, ano) # Utilizamos o Super para chamar o inicializador da classe mãe (tbm conhecida como super)
        self.duracao = duracao

    def __str__(self):
        return f'{self.nome} - {self.ano} - {self.duracao} min - {self.likes} Likes'

class Serie(Programa):
    def __init__(self, nome, ano, temporadas):
        super().__init__(nome, ano)
        self.temporadas = temporadas

    def __str__(self):
        return f'{self.nome} - {self.ano} - {self.temporadas} temporadas -  {self.likes} Likes'

class Playlist: # Para ficar de uma forma mais abstrata criamos uma CLASSE
    def __init__(self, nome, programas):
        self.nome = nome
        self.programas = programas

    def tamanho(self): # Método para medir o tamanho da Playlist
        return len(self.programas)


vingadores = Filme('vingadores - guerra infinita', 2018, 160) # instancia o objeto
atlanta = Serie('atlanta', 2018, 2) # instancia o objeto)
tmep = Filme('Rodo mundo em pânico', 1990, 100)
demolidor = Serie('Demolidor', 2016, 2)

vingadores.dar_like()
tmep.dar_like()
tmep.dar_like()
tmep.dar_like()
tmep.dar_like()
tmep.dar_like()
tmep.dar_like()
demolidor.dar_like()
demolidor.dar_like()
atlanta.dar_like()
atlanta.dar_like()
atlanta.dar_like()
atlanta.dar_like()

 # POLIMORFISMO #
filmes_e_series = [vingadores, atlanta, demolidor, tmep]
paylist_fim_de_semana = Playlist('fim de semana', filmes_e_series) # criando uma instância do objeto Paylist

for programa in paylist_fim_de_semana.programas: # Corre a nossa lista e retorna o conteúdo independente da classe
    # Porém desta forma é necessário que o programador conheça a estrutura da Classe Playlist para usar ".programas"
    print(programa) # retorno conforme o método __str__ (trata-se de um código mais pythônico)