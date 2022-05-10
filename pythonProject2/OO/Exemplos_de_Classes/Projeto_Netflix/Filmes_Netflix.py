from Exemplos_de_Classes.Projeto_Netflix.Classes.Classe_Cliente import Cliente

# cria a Instância do Objeto cliente #
cliente = Cliente("Rodrigo", "rodrigo@gmail.com", "basic")
print(cliente.plano)
cliente.ver_filme("Harry Potter", "premium")

# no botão de upgrade #
cliente.mudar_plano("premium")
print(cliente.plano)
cliente.ver_filme("Harry Potter", "premium")