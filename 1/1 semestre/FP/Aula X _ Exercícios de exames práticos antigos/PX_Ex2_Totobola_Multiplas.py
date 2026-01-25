import sys

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
	asimples=0
	aduplas=0
	atriplas=0
	with open("Jornada"+jor+".csv", "w") as f:
		for n in jogos:
			c+=1
			repeat=True
			while repeat:
				print(c, " ", n[0], " vs ", n[1], ": ", sep="", end="")
				try:
					asimplescopy=asimples
					aduplascopy=aduplas
					atriplascopy=atriplas
					aposta=input().strip()
					if (aposta=="1"):
						asimples+=1
					elif (aposta=="2"):
						asimples+=1
					elif (aposta=="X"):
						asimples+=1
					elif (aposta=="12"):
						aduplas+=1
					elif (aposta=="1X"):
						aduplas+=1
					elif (aposta=="X2"):
						aduplas+=1
					elif (aposta=="1X2"):
						atriplas+=1
					else:
						raise Exception
				except:
					print("ATENÇÃO! Valor inválido! Os valores válidos para uma aposta são '1', 'X', '2', '1X', 'X2', '12' ou '1X2'. Por favor tente novamente.")
				else:
					multiplas=(1**asimples)*(2**aduplas)*(3**atriplas)
					if (multiplas<=12 and multiplas%3==0 or multiplas<10 and multiplas%2==0 or multiplas==1):
						repeat=False
					else:
						print("ATENÇÃO! Não pode numa aposta ter {} apostas simples, {} duplas e {} triplas".format(asimples,aduplas,atriplas))
						print("Note que por cada aposta duplas, o número mínimo de apostas simples duplica e por cada tripla, triplica")
						asimples=asimplescopy
						aduplas=aduplascopy
						atriplas=atriplascopy
			f.write(str(c) + "," + aposta + "\n")
			boletim[(n[0],n[1])]=aposta
	print()
	print("[Sucesso]-----------------------------------------------------------")
	print("As suas apostas foram guardadas com sucesso no ficheiro {}!".format("Jornada"+jor+".csv"))
	print()
	resultado(boletim, jor, asimples, aduplas, atriplas, saldo)
	
def resultado(boletim, jor, asimples, aduplas, atriplas, saldo):
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
					resultado="(ERRADO)"
					if (boletim[aposta]=="X" and el[3]==el[4]):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="1" and el[3]>el[4]):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="2" and el[3]<el[4]):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="12" and (el[3]>el[4] or el[3]<el[4])):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="1X" and (el[3]>el[4] or el[3]==el[4])):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="X2" and (el[3]<el[4] or el[3]==el[4])):
						resultado="(CERTO)"
						certas+=1
					elif (boletim[aposta]=="1X2"):
						resultado="(CERTO)"
						certas+=1
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
	print("simples",asimples,"duplas",aduplas,"triplas",atriplas)
	asimples=1
	if (aduplas!=0):
		aduplas=2**aduplas
	else:
		aduplas=1
	if (atriplas!=0):
		atriplas=3**atriplas
	else:
		atriplas=1
	saldo-=(asimples*aduplas*atriplas)*0.4
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
	print("Pode ainda fazer apostas múltiplas (duplas ou triplas): '1X', 'X2', '12', '1X2'")
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
