from abc import ABC # abstract base classes
from collections.abc import MutableSequence, Sized
from numbers import Complex

class Playlist(MutableSequence):
    pass

filmes = Playlist()
# Da forma que está irá demonstrar na mensagem de erro, quais são os Métodos que necessito implementar


class Numero(Complex):
    def __getitem__(self, item):
        super().__getitem__()

filmes2 = Numero()
# Da forma que está irá demonstrar na mensagem de erro, quais são os Métodos que necessito implementar

"""
A classe abstrata serve para garantir uma idéia de comportamento que necessita ser seguido para sua implementação,
como se fosse um contrato, as cláusulas obrigatórias.
"""

# Criando uma Classe Abstrata #
from abc import ABCMeta, abstractmethod

class Programa(metaclass = ABCMeta):
    @abstractmethod
    def __str__(self):
        pass

"""
Desta forma não se pode criar uma instância da SuperClasse 'Programa', porém as Subclasses terão que implementar
o Método __str__ caso contrário retornará um erro de instanciação
"""