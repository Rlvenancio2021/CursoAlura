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

    # MÉTODO PRIVADO # só é acessado dentro da classe, porém pode ser acessado de forma direta
    def __pode_sacar(self, valor_a_sacar): # Com uderscore duplo, tranformamos o MÉTODO em privado
        valor_disponivel_a_sacar = self.saldo + self.limite
        return valor_a_sacar <= valor_disponivel_a_sacar # retorna True ou False

    def saca(self, valor):
        if self.__pode_sacar(valor):
            self.__saldo -= valor
        else:
            print(f"O valor {valor} ultrapassa o limite permitido.")

    def transfere(self, valor, destino):
        self.saca(valor) # O self permite acesso tanto o atributo como um método dentro da classe, dessa forma
                         # a conta origem é a conta que chamar o método "transfere"
        destino.deposita(valor)

    # PROPRIEDADE #
    # Uma outra forma de adicionar GETTERS e SETTERS
    @property
    def saldo(self):
        return self.__saldo

    @property
    def titular(self):
        return self.__titular

    @property # GET
    def limite(self):
        return self.__limite

    @limite.setter # SET
    def limite(self, limite):
        self.__limite = limite

    # MÉTODO ESTÁTICO #
    @staticmethod
    def codigo_banco():
        return "001"

    @staticmethod
    def codigos_banco():
        return {'BB':'001', 'Caixa':'104', 'Bradesco':'237', 'Itaú':'341'}