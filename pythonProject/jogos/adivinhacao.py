from Funcoes.funcoes_jogo_adivinhacao import *

def jogar_adivinhacao():

    imprime_mesangem_abertura()
    numero_secreto = escolhe_numero_secreto()
    print(numero_secreto)
    pontos = 1000

    imprime_nivel_dificuldade()
    nivel = escolhe_nivel_dificuldade()
    total_de_tentativas = escolhe_numero_tentativas(nivel)

    for rodada in range(1, total_de_tentativas + 1):
        imprime_total_tentativas(rodada, total_de_tentativas)
        chute = pede_chute()

        if chute < 1 or chute > 100:
            imprime_mensagem_alerta()
            continue

        acertou = chute == numero_secreto
        maior = chute > numero_secreto
        menor = chute < numero_secreto

        if acertou:
            imprime_msg_acertou(pontos)
            break
        else:
            if maior:
                imprime_msg_quando_maior(rodada, total_de_tentativas, numero_secreto)
            elif menor:
                imprime_msg_quando_menor(rodada, total_de_tentativas, numero_secreto)

        pontos = calcula_pontos(numero_secreto, chute, pontos)

    print("Fim do jogo")

if __name__ == "__main__":
    jogar_adivinhacao()