def jogar_forca():
    print("********************************")
    print("*** Bem vindo ao jogo forca! ***")
    print("********************************")

    palavra_secreta = "banana"

    enforcou = False
    acertou = False

    while (not enforcou and not acertou):

        chute = input("Qual letra? ")

        index = 0
        for letra in palavra_secreta:
            if chute == letra:
                print("Encontrei a letra {} na posição {}" .format(letra, index))
            index = index + 1

        print("jogando...")

    print("Fim do jogo")

if __name__ == "__main__":
    jogar_forca()
# Quando executampos em linha da comando pelo "python3 adivinhacao.py", por traz o python cria uma variável e atribui
# um valor a ela, porém quando importado ele não seta a variável