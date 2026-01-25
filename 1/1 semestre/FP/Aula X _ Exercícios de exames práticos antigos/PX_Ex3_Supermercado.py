import time
#Variáveis globais
produtos={}
stockout={}
venda={}
vendas=[]

def loadstock():
	print("[A carregar...]")
	print("A iniciar o programa...")
	print("A aceder à base de dados dos produtos.")
	print()
	try:
		with open("hipermercado.txt", "r") as dados:
			for line in dados:
				el = line.strip().split(";")
				produtos[int(el[0])]=(el[1],el[2],el[3],el[4])
	except Exception as e:
		print("[Erro no acesso à base de dados] Para iniciar este programa deve ter um documento com o nome 'hipermercado.txt' na mesma pasta que o programa, caso contário não será possível a sua execução.")
	else:
		print("[Sucesso] Os produtos foram carregados com sucesso da base de dados. O programa vai ser iniciado dentro de instantes.")
		main()


def inseriritens():
	print("[Inserir itens]")
	print()
	print("[Instruções] A inserção é ineterrupta, para cancelar e voltar ao normal, deve inserir o código produto '0' (zero).")
	repeat=True
	while repeat:
		try:
			cod = input("Qual o código do produto? ")
			if (cod.upper()=='MENU'):
				main()
			elif (int(cod) == 0):
				print("[Operação terminada] A regressar ao menu principal...")
				main()
			elif (int(cod) not in produtos):
				raise Exception
		except Exception as e:
			print("[Erro] O código de produto introduzido é inválido ou não existe produto associado ao mesmo, por favor tente novamente!")
		else:
			cod = int(cod)
			print("[{}] {}   {:.2f}€".format(cod,produtos[cod][0],(float(produtos[cod][2])*(1+(float(produtos[cod][3].split("%")[0])/100)))))
			seccao = produtos[cod][1].strip()
			if seccao not in venda:
				venda[seccao]={cod: 1}
			else:
				if cod not in venda[seccao]:
					venda[seccao][cod]=1
				else:
					venda[seccao][cod]+=1
			if cod in stockout:
				stockout[cod]+=1
			else:
				stockout[cod]=1
			print()
	print()
	print("[Sucesso] O item {} foi adicionado com sucesso à lista de vendas.".format(produtos[cod][0]))
	main()
	
def listaritens():
	print("[Listar itens]")
	print()
	print("{:>6}{:>25}{:>25}{:>10}{:>8}".format('Código','Nome do produto','Secção','Preço','IVA'))
	for el in produtos:
		print("{:>6}{:>25}{:>25}{:>10.2f}{:>8}".format(el,produtos[el][0],produtos[el][1],float(produtos[el][2]),produtos[el][3]))
	print()
	print("[Sucesso] Itens listados com sucesso.")
	main()

def faturar():
	data=time.strftime("%d/%m/%Y %H:%M")
	print("[Faturar]")
	print(data)
	print()
	#Verificação de que há produtos vendidos
	if len(venda)==0:
		print("[Erro] Não é possível faturar quando nenhum produto foi adicionado à venda.")
		main()
	#Emissão da fatura
	else:
		print("[FATURA]")
		print(data)
		print()
		total=0
		totalbruto=0
		categorias=[x for x in venda]
		categorias.sort()
		for cat in categorias:
			print(cat,":", sep="")
			for cod in venda[cat]:
				print("", end=" ")
				#Descrição
				print("{:>3} {} (IVA{})".format(venda[cat][cod], produtos[cod][0], produtos[cod][3]), end="\t")
				#Preço
				preco=float(produtos[cod][2])*(float(produtos[cod][3].split("%")[0])/100+1)*venda[cat][cod]
				totalbruto+=float(produtos[cod][2])*venda[cat][cod]
				total+=preco
				print("{:>20.2f}€".format(preco))
		print()
		print("Total Bruto:", end="\t")
		print("{:.2f}".format(totalbruto))
		print("Total IVA:", end="\t")
		print("{:.2f}".format(total-totalbruto))
		print("Total Líquido:", end="\t")
		print("{:.2f}".format(total))
		vendas.append("{}: {:.2f}".format(data,total))
		venda.clear()
		print()
		print("[Sucesso] Faturação efetuada com sucesso!")
		main()
	
def sair():
	print("[Sair]")
	print()
	print("A fechar o programa, por favor aguarde...")
	print()
	try:
		if (len(vendas)!=0):
			print("[A iniciar processo] A registar as vendas...")
			with open("Vendas.txt", "w") as f:
				for n in vendas:
					f.write(n+"\n")
			print("[Sucesso] As vendas desta sessão foram registadas com sucesso no ficheiro 'Vendas.txt', que se encontra localizado na pasta deste programa.")
			print()
			print("[A iniciar processo] A registar os produtos vendidos...")	
			with open("StockOut.txt", "w") as f:
				for n in stockout:
					f.write("{}; {}\n".format(n, stockout[n]))
			print("[Sucesso] Os produtos vendidos foram registados com sucesso no ficheiro 'StockOut.txt', localizado no mesmo local que o anteiormente mencionado.")
		else:
			print("[Registos] Não existem registos a fazer desta sessão, uma vez que não foram efetuados quaisquer registos de vendas.")
		print()
		print("---------------------------------------------------------------------------")
		print("Este programa foi feito no âmbito da cadeira de Fundamentos de Programação.")
		print("Todos os direitos reservados a Gonçalo Matos")
		print("MEC 92972 // LICENCIATURA EM ENGENHARIA INFORMÁTICA // Ano letivo 2018/19")
		exit(1)
	except Exception as e:
		print(e)
	

def main():
	print()
	print("------[MENU]------")
	print("(I)nserir itens")
	print("(L)istar itens disponíveis para venda")
	print("(F)aturar")
	print("(S)air")
	print("------------------")
	print()
	try:
		op = input(">").strip().upper()
		if (op not in ['I','L','F','S']):
			raise Exception
	except:
		print("[Erro] A opção introduzida é inválida, por favor tente novamente!")
		main()
	else:
		if (op=='I'):
			inseriritens()
		elif (op=='L'):
			listaritens()
		elif (op=='F'):
			faturar()
		elif (op=='S'):
			sair()
		
	
	
	
#O programa começa aqui
print()
print("[SUPERMERCADO]")
print()
print("Seja bem-vindo a este programa! Aqui vai poder gerir todas as operações associadas à atividade de um supermercado.")
print()
print()
loadstock()
