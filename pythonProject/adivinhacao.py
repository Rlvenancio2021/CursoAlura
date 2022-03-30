print("********************************")
print("Bem vindo ao jogo de Adivinhação")
print("********************************")

numero_secreto = 42
total_de_tentativas = 3

for rodada in range(1, total_de_tentativas + 1): # total_de_tentativas + 1 para garantir que tenhamos a 3 tentativas,
    #caso contrário quando a loop chegar no 3 ele irá parar sem executar.
    print("Tentativa {} de {}".format(rodada, total_de_tentativas))
    chute = int(input("Digite o seu número: "))

    acertou = chute == numero_secreto
    maior = chute > numero_secreto
    menor = chute < numero_secreto

    if(acertou):
        print("Parabéns! Você acertou!")
    else:
        if(maior):
            print("O seu chute foi maior do que o número secreto!")
        elif(menor):
            print("O seu chute foi menor do que o número secreto!")

print("Fim do jogo")