import os

usuario = os.environ['usuario']
senha = os.environ['senha']

print(usuario, senha)

"""
Na janela de opções no canto superior direito, clicar em Edit Configuration
Em Environmnent Variable abrir opções"""


#############################################

'''
Outra forma de fazer é
 - Criar um arquivo .env e escrever nele as variáveis
 - Instalar a biblioteca dotenv comando pip install python-dotenv ou !pip install python-dotenv no Juppter 
 - Importar a biblioteca - from dotenv import load_dotenv
 - Carregar o arquivo comando load_env()
'''