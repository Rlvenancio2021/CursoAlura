class Conta:
    def __init__(self, numero, titular, saldo, limite): # Função construtora
        print("Construindo objeto ...{}".format(self)) # self demonstra o endereço do obejto, processo interno do Python
        self.numero = numero
        self.titular = titular
        self.saldo = saldo
        self.limite = limite

    def extrato(self):
        print("Saldo de {} do titular {}".format(self.saldo, self.titular))

    def deposita(self, valor):
        self.saldo += valor

    def saca(self, valor):
        self.saldo -= valor