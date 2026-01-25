#Variáveis globais
clientes = {}

def validarnumero(numero):
	try:
		int(numero)
	except:
		if (numero=="EXIT"):
			print("OPERAÇÃO INTERROMPIDA A PEDIDO DO UTILIZADOR!")
			main()
		else:
			print("ATENÇÃO! O número introduzido não é válido. Por favor tente novamente.")
			return False
	else:
		if (len(str(int(numero)))<3):
			print("ATENÇÃO! O número introduzido não é válido. Por favor tente novamente.")
			return False
		else:
			return True
	

def registarchamada():
	print("[Registar Chamada]")
	repeat = True
	while repeat:
		origem = input("Telefone de origem? ").strip()
		repeat = not(validarnumero(origem))
	repeat = True
	while repeat:
		destino = input("Telefone de destino? ").strip()
		repeat = not(validarnumero(destino))
	repeat=True
	while repeat:
		try:
			duracao = input("Duração (s)? ").strip()
			duracao = int(duracao)
		except:
			if (duracao=="EXIT"):
				print("OPERAÇÃO INTERROMPIDA A PEDIDO DO UTILIZADOR!")
				main()
			else:
				print("ATENÇÃO! Duração inválida. Por favor tente novamente.")
		else:
			print("O registo da chamada foi feito com sucesso!")
			repeat=False
	if origem not in clientes:
		clientes[origem]=[(destino, duracao)]
	else:
		clientes[origem]+=[(destino, duracao)]
	print()
	print("OPERAÇÃO TERMINADA------------------------------------------------------------")
	main()
	
def lerficheiro():
	print("[Ler Ficheiro]")
	print()
	repeat = True
	while repeat:
		try:
			name = input("Qual o nome do ficheiro? "	).strip()
			with open(name, "r") as fil:
				for line in fil:
					elements=line.split("\t")
					if elements[0].strip() not in clientes:
						clientes[elements[0].strip()]=[(elements[1].strip(),elements[2].strip())]
					else:
						clientes[elements[0].strip()]+=[(elements[1].strip(),elements[2].strip())]
		except:
			if (name=="EXIT"):
				print("OPERAÇÃO INTERROMPIDA A PEDIDO DO UTILIZADOR!")
				main()
			else:
				print("ATENÇÃO! Lamentamos informar que não encontramos o ficheiro que pretende ou que este tem um formato inválido. Verifique se escreveu o seu nome corretamente e tente novamente.")
		else:
			print("O ficheiro foi lido com sucesso e os seus dados foram registados na área dos clientes!")
			repeat = False
			
	print()
	print("OPERAÇÃO TERMINADA------------------------------------------------------------")
	main()

def listarclientes():
	print("[Listar Clientes]")
	print()
	lista=[]
	if (len(clientes)>0):
		for origem in clientes:
			lista.append(origem)
		lista.sort()
		for n in lista:
			print(n, end="   ")
	else:
		print("Lamentamos informar, mas de momento não existem registos de clientes. Por favor verifique que introduziu dados ou importou algum ficheiro com sucesso.")
	print();print()
	print("OPERAÇÃO TERMINADA------------------------------------------------------------")
	main()
	
def fatura():
	print("[Faturação]")
	print()
	repeat=True
	while repeat:
		numero = input("Qual o cliente para o qual pretende obter uma fatura? ").strip()
		repeat = not(validarnumero(numero))
	if numero not in clientes:
		print("Lamentamos informar, mas não existem registos para o número {}. Aconselhamos que verifique os números para os quais existem registos atráves da opção 'Listar Números' no menu.".format(numero))
	else:
		registos = clientes[numero]
		print(registos)
		print("{:<20}{:>7}{:>10}".format("Destino","Duração","Custo"))
		total=0
		for n in registos:
			if (str(n[0])[0]=="+"):
				#Número internacional
				custo=(0.8/60)*int(n[1])
			elif (str(n[0])[0]=="2"):
				#Rede fixa
				custo=(0.02/60)*int(n[1])
			elif (str(n[0])[0:2]==str(int(numero))[0:2]):
				#Mesma rede
				custo=(0.04/60)*int(n[1])
			else:
				#Outra rede (Outros destinos)
				custo=(0.10/60)*int(n[1])
			total+=custo
			print("{:<20}{:>7}{:>10.2f}".format(n[0],n[1],round(custo, 2)))
		print("{:<20}{:>7}{:>10.2f}".format("","Total:",round(total, 2)))
	print()
	print("OPERAÇÃO TERMINADA------------------------------------------------------------")
	main()
	
def terminar():
	print("[Terminar]")
	print("O programa vai terminar...")
	print("Esperamos voltar a vê-lo em breve!")
	print()
	print("Este programa foi feito no âmbito da cadeira de Fundamentos de Programação.")
	print("Todos os direitos reservados a Gonçalo Matos")
	print("MEC 92972 // LICENCIATURA EM ENGENHARIA INFORMÁTICA // Ano letivo 2018/19")
	exit(1)

def main():
	print()
	print("[TELECOMUNICAÇÕES]")
	print()
	print("------MENU------")
	print("1) Registar chamada")
	print("2) Ler ficheiro")
	print("3) Listar clientes")
	print("4) Fatura")
	print("5) Terminar")
	print()
	try:
		op = int(input("Opção? ").strip())
	except:
		print()
		print("ATENÇÃO! A opção introduzida não é válida! Por favor tente novamente.")
		print("------------------------------------------------------------------------------")
		main()
	else:
		print()
		print("SUCESSO-----------------------------------------------------------------------")
		print()
		if (op==1):
			registarchamada()
		elif (op==2):
			lerficheiro()
		elif (op==3):
			listarclientes()
		elif (op==4):
			fatura()
		elif (op==5):
			terminar()
		else:
			print()
			print("ATENÇÃO! A opção introduzida não é válida! Por favor tente novamente.")
			print("------------------------------------------------------------------------------")
			main()
	
	
	
	
#O programa começa aqui
print()
print("Seja bem-vindo ao programa da [Telecomunicações]!")
print()
print("[Intruções]")
print("Este programa tem como objetivo facilitar a gestão dos clientes de uma operadora telefónica e de todas as operações associadas a estes.")
print("Em qualquer função do programa, pode escrever 'EXIT' e será reenviado de volta para o menu principal.")
print("Atenção que 'EXIT' deve ser escrito em letras maiúsculas e de preferência sem espaços antes ou no final.")
print()
print("INSTRUÇÕES TERMINADAS---------------------------------------------------------")
main()
