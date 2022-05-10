# Fonte: https://youtu.be/gomDSZaay3E
# Vamos criar uma classepara Clientes da Netflix

class Cliente:
    # ATRIBUTOS #
    def __init__(self, nome, email, plano):
        self.nome = nome
        self.email = email
        self.lista_planos = ["basic", "premium"]
        # variável self.lista_planos não está no parâmetro por não ser obrigatório para criar o cliente,
        # porém possúi o "self." pois necessitamos que ela esteja visível para outra função dentro da classe
        if plano in self.lista_planos:
            self.plano = plano
        else:
            raise Exception("Plano inválido")
            # exibe mensagem de erro quando o plano digitado não consta de lista e não cria o cliente
    # MÉTODOS #
    def mudar_plano(self, novo_plano):
        # variável novo_plano é utilizada apenas nesta função por isso não possúi o "self."
        if novo_plano in self.lista_planos:
            self.plano = novo_plano
        else:
            print("Plano inválido")

    def ver_filme(self, filme, plano_filme):
        if self.plano == plano_filme:
            print("Ver Filme {}".format(filme))
        elif self.plano == "premium":
            print(f"Ver Filme {filme}")
        elif self.plano == "basic" and plano_filme == "premium":
            print("Faça upgrade para premium para ver esse filme")
        else:
            print("Plano Inválido")