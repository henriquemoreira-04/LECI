#Variáveis globais
jornadas={}

def aposta(saldo):
	print()
	print("[Aposta]---------------------------------------------------------------")
	repeat= True
	while repeat:
		print()
		jor = input("Qual a jornada em que quer apostar? ").strip()
		if jor=="0":
			terminar()
		try:
			if int(jor) in jornadas:
				repeat=False
			else:
				raise Exception
		except:
			print("ATENÇÃO! A jornada introduzida não é válida, por favor tente novamente")
			print("[Nota] As jornadas disponíveis para aposta são: ", end="")
			for n in jornadas:
				print(n, end="  ")
	jogos = jornadas[int(jor)]
	c = 0
	boletim={}
	with open("Jornada"+jor+".csv", "w") as f:
		for n in jogos:
			c+=1
			repeat=True
			while repeat:
				print(c, " ", n[0], " vs ", n[1], ": ", sep="", end="")
				try:
					aposta=input().strip()
					if not (aposta=="1" or aposta=="2" or aposta=="X"):
						raise Exception
					else:
						repeat=False				
				except:
					print("ATENÇÃO! Valor inválido! Os valores válidos para uma aposta são '1', 'X' ou '2'. Por favor tente novamente.")
			f.write(str(c) + "," + aposta + "\n")
			boletim[(n[0],n[1])]=aposta
	print()
	print("[Sucesso]-----------------------------------------------------------")
	print("As suas apostas foram guardadas com sucesso no ficheiro {}!".format("Jornada"+jor+".csv"))
	print()
	resultado(boletim, jor, saldo)
	
def resultado(boletim, jor, saldo):
	print("[Resultado]------------------------------------------------------------")
	print()
	print("Jornada "+jor)
	with open("Jogos.csv","r") as f:
		c=0
		certas = 0
		for line in f:
			el = line.strip().split(",")
			for aposta in boletim:
				if (aposta[0]==el[1] and aposta[1]==el[2]):
					c+=1
					if (boletim[aposta]=="X" and el[3]==el[4]):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="1" and el[3]>el[4]):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="2" and el[3]<el[4]):
						resultado="(CERTO)"
						certas+=1
					else:
						resultado="(ERRADO)"
					print("{:<3}{:>15}{:^6}{:<15}{:^3}{:^3}{:>10}".format(c, el[1], el[3]+"-"+el[4], el[2], " : ", boletim[aposta], resultado))
	print()
	print("Tem {} apostas certas.".format(certas), end=" ")
	if (certas==9):
		print("GANHOU o 1.º prémio!")
		saldo+=5000
	elif (certas==8):
		print("GANHOU o 2.º prémio!")
		saldo+=1000
	elif (certas==7):
		print("GANHOU o 3.º prémio!")
		saldo+=100
	else:
		print("SEM PRÉMIO!")
	print()
	saldo-=0.40
	print("Está com um saldo de {:.2f}".format(saldo))
	print()
	print("[A CARREGAR NOVA APOSTA...]--------------------------------------------")
	print("Estamos a preparar-nos para que possa fazer uma nova aposta.")
	print("Para cancelar a nova aposta e fazer o pagamento das apostas já feitas, por favor indique '0' na jornada a apostar.")
	repetir(saldo)
	
def repetir(saldo):
	aposta(saldo)

def terminar():
	print("[SAIR]-----------------------------------------------------------------")
	print("A fechar a aplicação...")
	print()
	print("Este programa foi feito no âmbito da cadeira de Fundamentos de Programação.")
	print("Todos os direitos reservados a Gonçalo Matos")
	print("MEC 92972 // LICENCIATURA EM ENGENHARIA INFORMÁTICA // Ano letivo 2018/19")
	exit(1)
		
			

def main():
	saldo=0
	print()
	print("[TOTOBOLA]-------------------------------------------------------------")
	print()
	print("[Instruções]-----------------------------------------------------------")
	print()
	print("Para apostar, deve selecionar a jornada em que quer apostar e uma vez selecionada, escrever qual a sua aposta para cada jogo da jorgada")
	print("As opções de aposta para cada jogo são '1', no caso de apostar na vitória do clube que joga em casa, 'X' no caso de empate e '2' no caso de vitória da outra equipa.")
	print()
	with open("Jornadas.csv", "r") as f:
		for line in f:
			el=line.strip().split(",")
			if int(el[0]) not in jornadas:
				jornadas[int(el[0])]=[(el[1],el[2])]
			else:
				jornadas[int(el[0])]+=[(el[1],el[2])]
	aposta(saldo)


#O programa começa aqui
main()
