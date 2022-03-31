def jogar_forca():
    print("********************************")
    print("*** Bem vindo ao jogo forca! ***")
    print("********************************")

    palavra_secreta = "banana"
    letras_acertadas = ["_", "_", "_", "_", "_", "_"]

    enforcou = False
    acertou = False

    print(letras_acertadas)

    while (not enforcou and not acertou):

        chute = input("Qual letra? ").strip()

        index = 0
        for letra in palavra_secreta:
            if chute.upper() == letra.upper():
               letras_acertadas[index] = letra
            index = index + 1

        print(letras_acertadas)

    print("Fim do jogo")

if __name__ == "__main__":
    jogar_forca()
# Quando executampos em linha da comando pelo "python3 adivinhacao.py", por traz o python cria uma variável e atribui
# um valor a ela, porém quando importado ele não seta a variável