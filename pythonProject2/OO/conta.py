class Conta:
    def __init__(self, numero, titular, saldo, limite): # Função construtora
        print("Construindo objeto ...{}".format(self)) # self demonstra o endereço do obejto, processo interno do Python
        self.__numero = numero
        self.__titular = titular
        self.__saldo = saldo
        self.__limite = limite
        # Adicionado underscore duplo "__" para que o ATRIBUTO da CLASSE sejá acessado pelo MÉTODO.
        # Porém ainda é possível acessa-lós de forma direta usando o nome "_Conta__numero", mas não é recomendável

    def extrato(self):
        print("Saldo de {} do titular {}".format(self.__saldo, self.__titular))

    def deposita(self, valor):
        self.__saldo += valor

    def saca(self, valor):
        self.__saldo -= valor

    def transfere(self, valor, destino):
        self.saca(valor) # O self permite acesso tanto o atributo como um método dentro da classe, dessa forma
                         # a conta origem é a conta que chamar o método "transfere"
        destino.deposita(valor)

    # Métodos GETTERS (obter) e SETTERS (alterar) #
    def get_saldo(self):
        return self.__saldo

    def get_titular(self):
        return self.__titular

    def get_limite(self):
        return self.__limite

    def set_limite(self, limite):
        self.__limite = limite