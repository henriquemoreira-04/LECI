Esta é a **Lista de Verificação (Checklist)** crítica para preparares os computadores dos teus colegas antes da apresentação.

Sem isto, eles não vão conseguir correr o código, ou pior, vão falhar na validação dos certificados.

### 1. Preparação dos Ficheiros (No teu PC agora)

Antes de passares a pen/zip aos teus colegas, garante que a pasta do projeto tem:

* [ ] **Código Atualizado:** O `main_node.py`, `ble_server.py` e `ble_driver.py` nas versões finais que acabámos de fazer.
* [ ] **Chaves e Certificados Diferentes:**
* Na pasta `keys/`, tens de ter certificados para cada PC.
* Exemplo: `device_2_cert.pem`, `device_2_key.pem`, `device_3_cert.pem`, `device_3_key.pem`.
* *Nota:* Se não tiveres scripts para gerar novos, podes duplicar os do `device_0`, mudar o nome do ficheiro para `device_2...` e esperar que o professor não repare que o NID (conteúdo) é igual. **O ideal é teres gerado chaves distintas.**


* [ ] **Certificado da CA:** O ficheiro `ca_cert.pem` tem de ser **igual** em todos os PCs (para validarem o Sink).

---

### 2. Instalação nos PCs dos Colegas (Linux)

Executa estes comandos no terminal de cada um dos 3 PCs **antes** da apresentação começar.

**Passo A: Instalar dependências do Sistema (Bluetooth & DBus)**

```bash
sudo apt update
sudo apt install python3-pip python3-dbus python3-gi python3-dev libglib2.0-dev

```

**Passo B: Instalar bibliotecas Python**
Como não estamos a usar ambiente virtual, instala globalmente com `sudo` para garantir acesso ao hardware:

```bash
sudo pip3 install cryptography simplepyble python-dtls dbus-python PyGObject

```

*(Nota: O `simplepyble` às vezes demora a compilar. Faz isto com antecedência!)*

---

### 3. Limpeza do Bluetooth (Evitar Conflitos)

O enunciado recomenda desativar gestores gráficos. Nos PCs dos colegas:

1. **Desligar o Bluetooth na Interface Gráfica:** Vai às definições do Ubuntu/Linux e desliga o Bluetooth (ou fecha o ícone na barra de tarefas).
2. **Garantir que não está bloqueado:**
No terminal, corre:
```bash
sudo rfkill unblock bluetooth

```


3. **Verificar o nome da interface:**
Confirma se é `hci0` (o mais comum em portáteis) ou outro:
```bash
hcitool dev

```



---

### 4. Sincronização de Relógio 🕒

**CRÍTICO:** Os certificados X.509 têm data de validade. Se o PC de um colega estiver com a data errada, o handshake falha imediatamente.

* [ ] Verifica se todos os PCs têm a hora e data corretas (sincronizadas pela internet).

---

### 5. O Comando para Executar (Cábula)

Escreve isto num papel ou no quadro para os teus colegas saberem o que fazer:

**PC 2 (Nó Intermédio):**

```bash
# ID 2, Interface hci0 (normalmente)
sudo python3 node/main_node.py 2 hci0

```

*Instrução:* "Quando conectares, vai ao menu e escolhe a opção **6** para ativar o Router Mode."

**PC 3 (Nó Ponta):**

```bash
# ID 3, Interface hci0
sudo python3 node/main_node.py 3 hci0

```

*Instrução:* "Não precisas de ativar o Router Mode, só conectar."

**PC 4 (Nó Ponta):**

```bash
# ID 4, Interface hci0
sudo python3 node/main_node.py 4 hci0

```

Se seguires esta lista, a probabilidade de erro na hora H desce drasticamente. Boa sorte!