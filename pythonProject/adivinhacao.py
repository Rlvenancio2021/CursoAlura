print("*********************************")
print("Bem vindo no jogo de Adivinhação!")
print("*********************************")

numero_secreto = 42

chute = int(input("Digite o seu numero: "))

print("Você digitou",chute)

if (numero_secreto == chute):
    print("Você acertou")
else:
    print("Você errou")

print("Fim do jogo!")