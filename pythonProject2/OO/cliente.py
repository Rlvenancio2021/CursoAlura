class Cliente:
    def __init__(self, nome):
        self.__nome = nome

    # PROPRIEDADE #
    @property
    # GET
    def nome(self): # O método precisar ser o mesmo nome do atributo.
        print("chamando @property nome()")
        return self.__nome.title()

    #SET
    @nome.setter
    def nome(self, nome):
        print("chamando setter nome()")
        self.__nome = nome