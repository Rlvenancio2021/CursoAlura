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

vingadores = Filme('vingadores - guerra infinita', 2018, 160) # instancia o objeto
vingadores.dar_like()

atlanta = Serie('atlanta', 2018, 2) # instancia o objeto)
atlanta.dar_like()
atlanta.dar_like()

 # POLIMORFISMO #
filmes_e_serias = [vingadores, atlanta]

for programa in filmes_e_serias: # Corre a nossa lista e retorna o conteúdo independente da classe
    print(programa) # retorno conforme o método __str__ (trata-se de um código mais pythônico)