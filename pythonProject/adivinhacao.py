print("*********************************")
print("Bem vindo no jogo de Adivinhação!")
print("*********************************")

numero_secreto = 42

chute = int(input("Digite o seu numero: "))

print("Você digitou",chute)

acertou = chute == numero_secreto
maior = chute > numero_secreto
menor = chute < numero_secreto

if (acertou):
    print("Você acertou")
else:
    if(maior):
        print("Você errou! O seu chute foi maior do que o numero secreto.")
    elif (menor): # Só executa o ELIF caso o a condição do IF seja falsa
        print("Você errou! O seu chute foi menor do que o numero secreto.")

print("Fim do jogo!")