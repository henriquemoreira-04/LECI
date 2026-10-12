# Projeto SIC: Secure IoT Ad-Hoc Network over Bluetooth

## Identificação do Grupo
* **André Barros Reis** (Número: 119814) - Contribuição: 25%
* **Henrique Moreira Malaver** (Número: 119809) - Contribuição: 25%
* **João António Henriques Vieira** (Número: 118643) - Contribuição: 25%
* **Vasco Rocha Oliveira** (Número: 119113) - Contribuição: 25%

## 1. Visão Geral
Este projeto implementa uma rede *ad-hoc* segura para dispositivos IoT, utilizando **Bluetooth Low Energy (BLE)** como camada de ligação. O sistema permite que múltiplos nós (sensores) comuniquem com um Sink central através de uma topologia em árvore multi-hop, garantindo autenticação mútua, integridade e confidencialidade "end-to-end" via DTLS.

O projeto foi desenvolvido em Python sobre Linux, utilizando a stack BlueZ e primitivas criptográficas standard.

## 2. Arquitetura e Decisões de Design

### 2.1 Topologia e Routing
* **Topologia em Árvore:** A rede organiza-se hierarquicamente, onde cada dispositivo se conecta a um *Uplink* (Pai) para alcançar o Sink.
* **Forwarding (Backward Learning):** Implementámos um mecanismo de encaminhamento inspirado em *switches*. Cada nó mantém uma `Forwarding Table` dinâmica. Ao receber um pacote, o nó associa o NID (Network Identifier) de origem à conexão de onde veio.
* **Lazy Approach:** Na fase de descoberta, os nós conectam-se ao primeiro dispositivo válido encontrado (Sink ou Router) para minimizar a latência de entrada na rede.

### 2.2 Superação de Limitações BLE (Fragmentação)
Devido ao MTU reduzido do BLE, foi necessário implementar uma camada de aplicação para **Fragmentação e Remontagem**.
* **Driver:** Divide mensagens grandes (ex: certificados X.509) em *chunks* sequenciais.
* **Server:** Possui um buffer inteligente que analisa o cabeçalho do protocolo SIC para determinar o tamanho total da mensagem e só a processa quando completa.

### 2.3 Gestão de Falhas (Chain Reaction)
Para garantir a integridade da topologia:
* **Heartbeats:** O Sink emite mensagens de *liveness* assinadas a cada 5 segundos.
* **Deteção de Falha:** Se um nó perder 3 heartbeats consecutivos do seu Uplink, assume que a conexão caiu.
* **Reação em Cadeia:** O nó desconecta imediatamente todos os seus *downlinks* (filhos), forçando a sub-árvore a reiniciar o processo de descoberta e conexão.

## 3. Segurança (Implementação)

### 3.1 Identificação e PKI
Todos os dispositivos são identificados por um **NID** de 128 bits e possuem certificados **X.509**.
* Utilizámos a curva elíptica **SECP521R1 (P-521)** para chaves públicas, conforme sugerido.
* Existe uma Autoridade de Certificação (CA) central que emite todos os certificados.

### 3.2 Protocolo SIC (Autenticação Mútua)
Antes de qualquer troca de dados, é executado um handshake de segurança:
1. **Hello:** Troca de Certificados e *Nonces* para garantir frescura.
2. **Validação:** Verificação da cadeia de confiança da CA.
3. **ECDH:** Acordo de chaves Diffie-Hellman para gerar chaves de sessão únicas.
4. **Assinatura:** Todas as trocas são assinadas digitalmente para garantir autenticação e não-repúdio.

### 3.3 Túnel DTLS (End-to-End)
Para cumprir o requisito de segurança fim-a-fim, desenvolvemos uma **Bridge UDP**:
* O tráfego aplicacional é encapsulado num túnel **DTLS** (via `python-dtls`).
* Criámos sockets virtuais locais que injetam os pacotes DTLS dentro dos frames Bluetooth, permitindo o uso de criptografia standard da Internet sobre a rede ad-hoc.

## 4. Funcionalidades Implementadas

| Funcionalidade | Estado | Detalhes |
|---|---|---|
| **Conexão BLE** | Completo | Scan e conexão automática. |
| **Autenticação Mútua** | Completo | Handshake SIC com certificados e ECDH. |
| **Multi-Hop Routing** | Completo | Suporte a saltos intermédios (testado em cadeia). |
| **Heartbeat** | Completo | Propagação de HB assinado e timeouts. |
| **Chain Reaction** | Completo | Desconexão recursiva em caso de falha de uplink. |
| **DTLS End-to-End** | Completo | Dados de sensores cifrados até ao Sink. |
| **User Interface** | Completo | Menu com status, hops, forwarding table e controlos. |
| **Inbox Service** | Completo | Envio de mensagens de sensores para o Sink. |
| **Network Controls** | Completo | Simulação de falha de link (Stop HB). |

## 5. Estrutura do Projeto

O código está organizado conforme os requisitos de entrega:

* **`sync/`**: Código exclusivo do Sink (`main_sink.py`),
* **`node/`**: Código dos dispositivos IoT (`main_node.py` e transporte DTLS),
* **`common/`**: Drivers BLE, Servidor GATT, Protocolo e Criptografia,
* **`support/`**: Scripts utilizados para a geração da PKI (CA e Certificados),
* **`keys/`**: Repositório de chaves e certificados para demonstração,
* **`README.md`**: Documentação do projeto.

```
├── common                      # Bibliotecas partilhadas e Drivers
│   ├── ble_driver.py           # Cliente BLE (Scan, Connect, Fragmentação)
│   ├── ble_server.py           # Servidor GATT (DBus, Advertising)
│   ├── cert_utils.py           # Carrega e valida certificados X.509
│   ├── crypto_utils.py         # Assinaturas, HMAC e Derivação de chaves 
│   ├── protocol.py             # Definições do protocolo SIC
├── keys                        # Chaves para os dispositivos e CA
│   ├── ca_cert.pem
│   ├── ca_key.pem
│   ├── device_0_cert.pem
│   ├── device_0_key.pem
│   ├── device_1_cert.pem
│   ├── device_1_key.pem
│   ├── device_2_cert.pem
│   ├── device_2_key.pem
│   ├── device_3_cert.pem
│   ├── device_3_key.pem
│   ├── device_4_cert.pem
│   ├── device_4_key.pem
│   ├── sink_cert.pem
│   └── sink_key.pem
├── node                        # Código dos Nós
│   ├── dtls_transport.py       # DTLS
│   ├── main_node.py            # Script principal do Node
├── sync                        # Código do Sink (Gateway)
│   └── main_sink.py            # Script principal do Sink
├── support                     
│   └── pki_gen.py              # Script de geração da PKI
├── README.md                   # Relatório
```

## 6. Instruções de Execução

O projeto requer privilégios de `sudo` para acesso ao adaptador HCI.

### 6.1 Executar o Sink (Gateway)
```bash
sudo python3 sync/main_sink.py <ID> <INTERFACE>
```
***Exemplo:** sudo python3 sync/main_sink.py 1 hci0*

### 6.2 Executar um Nó (Sensor)
```bash
sudo python3 node/main_node.py <ID> <INTERFACE>
```
***Exemplo:** sudo python3 node/main_node.py 2 hci0*

### 6.3 Modo Router (Importante para Multi-Hop)

Por questões de estabilidade em demonstrações com poucos recursos de hardware, o Router Mode (capacidade de aceitar filhos) vem desativado por defeito nos nós.

Para criar uma cadeia (ex: Nó A -> Nó B -> Sink), deve-se ativar a Opção 6 ("Router Mode") no menu do Nó intermédio após este se conectar ao Sink.

## 7. Conclusão

Este projeto demonstrou a viabilidade de implementar uma rede IoT segura e resiliente utilizando exclusivamente Bluetooth Low Energy, sem recorrer a hardware Mesh especializado. A arquitetura desenvolvida cumpre integralmente os requisitos de segurança propostos, assegurando a confidencialidade, integridade e autenticidade dos dados desde o sensor até ao Sink.

A implementação de uma Bridge DTLS sobre o protocolo customizado (SIC) provou ser uma estratégia eficaz para utilizar protocolos de segurança standard da indústria sobre um meio de comunicação fragmentado e limitado como o BLE. Além disso, os mecanismos de Liveness Check e Chain Reaction conferem à rede a capacidade de auto-recuperação necessária para ambientes ad-hoc dinâmicos.
