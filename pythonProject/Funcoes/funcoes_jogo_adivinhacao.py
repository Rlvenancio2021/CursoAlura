import random

def imprime_mesangem_abertura():
    print("********************************")
    print("Bem vindo ao jogo de Adivinhação")
    print("********************************")

def escolhe_numero_secreto():
    numero_secreto = random.randrange(0,101)
    return numero_secreto

def imprime_nivel_dificuldade():
    print("Qual nível de dificuldade?")
    print("(1) Fácil (2) Médio (3) Difícil")

def escolhe_nivel_dificuldade():
    nivel = int(input("Defina o nível: "))
    return nivel

def escolhe_numero_tentativas(nivel):
    if nivel == 1:
        total_de_tentativas = 20
    elif nivel == 2:
        total_de_tentativas = 10
    else:
        total_de_tentativas = 5
    return total_de_tentativas

def imprime_total_tentativas(rodada, total_de_tentativas):
    print("Tentativa {} de {}".format(rodada, total_de_tentativas))

def pede_chute():
    chute = int(input("Digite o seu número: "))
    return chute

def imprime_msg_acertou(pontos):
    print("Parabéns você acertou! Você fez {} pontos" .format(pontos))

def imprime_msg_quando_maior(rodada, total_de_tentativas, numero_secreto):
    print("O seu chute foi maior do que o número secreto!")
    if rodada == total_de_tentativas:
        print("O número secreto era {}. Pontos não computados!".format(numero_secreto))

def imprime_msg_quando_menor(rodada, total_de_tentativas, numero_secreto):
    print("O seu chute foi menor do que o número secreto!")
    if rodada == total_de_tentativas:
        print("O número secreto era {}. Pontos não computados!".format(numero_secreto))

def imprime_mensagem_alerta():
    print("Você deve digitar um número entre 1 e 100!")

def calcula_pontos(numero_secreto, chute, pontos):
    pontos_perdidos = abs(numero_secreto - chute)
    pontos = pontos - pontos_perdidos
    return pontos