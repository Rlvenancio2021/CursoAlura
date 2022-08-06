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

'''
Usando dotenv
1. Cria uma pasta chamado .env;
2. Escreve as variáveis nela, ex:
	username = "escreva aqui o username desejado"
	senha = "escreva aqui a senha desejada"
3. Instalar a biblioteca dotenv comando pip install python-dotenv ou !pip install python-dotenv no Juppter;
4. No arquivo onde serão usados as informações de "USUÁRIO" e "SENHA", seguir com o procedimento:
	4.1. Importar bibliote dotenv "import dotenv"
	4.2. Informa ao dotenv qual será o arquivo que ele irá ler:
		"dotenv.find_dotenv()" assim ele irá procurar a partir do diretorio raiz, este comando aponta o caminho da pasta;
		"dotenv.load_dotenv()" comando para carregar as variáveis;

		# Comando que efetivamente carrega os valores do arquivo é:
		"dotenv.load_dotenv(dotenv.find_dotenv())"
	4.3. Importar a biblioteca "os" para acessar os valores, comando "import os"
	4.4. No local no código onde se deseja utilizar a informação seguir da sequinte forma:
		Variável local que desejamos carregar o valor da variável de ambiente, utilizamos o comando GET e passamos como parametro o nome da variável desejada conforme declarada no arquivo .env:
			usuario = os.getenv("username")
			senha = os.getenv("senha")
'''
