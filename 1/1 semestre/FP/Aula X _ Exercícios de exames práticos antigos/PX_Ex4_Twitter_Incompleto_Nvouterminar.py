
# O módulo json permite descodificar ficheiros no formato JSON.
# São ficheiros de texto que armazenam objetos compostos que podem incluir
# números, strings, listas e/ou dicionários.
import json

# Abre o ficheiro e descodifica-o criando o objeto twits.
with open("twitter.json", encoding="utf8") as f:
    twits = json.load(f)

#Variáveis globais
n=0
hashtags=[]
words=[]

#Análise dos twits
for twit in twits:
	n+=1
	print(n)
	text = twit['text'].strip().split(" ")
	for word in text:
		word=word.strip()
		#Verify i the word is an hashtag
		if '#' in word:
			present=False
			for el in hashtags:
				if word in el:
					el[1]+=1
					present=True
			if not present:
				hashtags.append([word,1])				
		"""If not
		else:
			if word in words:
				words[word]+=1
			else:
				words[word]=1"""

#print(words)
mosthash=sorted(hashtags, key=lambda n:(n[1], n[0]), reverse=True)[1:17]
print("As hashtags mais nos trends são...")
n=0
for x in mosthash:
	n+=1
	print("{:>3}{:>20}{:>3}".format(n,n[0],n[1]))
