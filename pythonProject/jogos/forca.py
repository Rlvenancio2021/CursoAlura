from Funcoes.funcoes_jogo_forca import *

def jogar_forca():
    imprime_mensagem_abertura()
    palavra_secreta = escolhe_palavra_secreta()
    print(palavra_secreta)
    letras_acertadas = inicia_letras_acertadas(palavra_secreta)
    print(letras_acertadas)

    enforcou = False
    acertou = False
    erros = 0

    while not enforcou and not acertou:

        chute = pede_chute()
        if chute in palavra_secreta:
            marca_chute_correto(chute, letras_acertadas, palavra_secreta)
        else:
            erros += 1
            print("Você errou, ainda tem {} tentativas".format(len(palavra_secreta) - erros))
            if erros == (len(palavra_secreta)-1):
                print("Essa é a sua ultima chance")
        if erros == len(palavra_secreta):
            break
        if "_" not in letras_acertadas:
            acertou = True
        print(letras_acertadas)

    if acertou:
        imprime_mensagem_vencedor()
    else:
        imprime_mensagem_perdedor(palavra_secreta)

if __name__ == "__main__":
    jogar_forca()