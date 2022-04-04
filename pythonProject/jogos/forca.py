def jogar_forca():
    print("********************************")
    print("*** Bem vindo ao jogo forca! ***")
    print("********************************")

    palavra_secreta = "banana".upper()
    letras_acertadas = ["_" for letra in palavra_secreta] # automatiza o preenchimento inicial da lista,
    # este formato chama-se List Comprehension / Compreensão de Lista.

    enforcou = False
    acertou = False
    erros = 0

    print(letras_acertadas)

    while (not enforcou and not acertou):

        chute = input("Qual letra? ").strip().upper()

        if chute in palavra_secreta: # Condição criada para teste e incremento do erro, caso ocorra.
            index = 0
            for letra in palavra_secreta:
                if chute == letra:
                   letras_acertadas[index] = letra
                index += 1
        else:
            erros += 1
            print("Você errou, ainda tem {} tentativas".format(len(palavra_secreta) - erros))
            if erros == (len(palavra_secreta)-1):
                print("Essa é a sua ultima chance")

        if erros == 6: # Verificar se atingiu o total de tentativas
            break

        if "_" not in letras_acertadas: # Verificar o conteúdo das letras acertadas
            acertou = True
        #enforcou = erros == 6 # Verificar se atingiu o total de tentativas
        #acertou = "_" not in letras_acertadas # Verificar o conteúdo das letras acertadas
        print(letras_acertadas)

    if acertou:
        print("Você ganhou!!")
    else:
        print("Você perdeu!!")
    print("Fim do jogo")

if __name__ == "__main__":
    jogar_forca()
# Quando executampos em linha da comando pelo "python3 adivinhacao.py", por traz o python cria uma variável e atribui
# um valor a ela, porém quando importado ele não seta a variável