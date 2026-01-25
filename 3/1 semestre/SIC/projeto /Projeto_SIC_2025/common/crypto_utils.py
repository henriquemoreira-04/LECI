import os
from cryptography.hazmat.primitives import hashes, hmac
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives.kdf.hkdf import HKDF
from cryptography.exceptions import InvalidSignature

def derive_session_key(local_private_key, peer_public_key, local_nonce, peer_nonce):
    # Constroi a ECDH
    shared_secret = local_private_key.exchange(ec.ECDH(), peer_public_key)
    session_salt = local_nonce + peer_nonce

    derived_key = HKDF(
        algorithm=hashes.SHA256(),
        length=32,
        salt=session_salt,
        info=b'sic-project-session-key',
    ).derive(shared_secret)

    return derived_key

def sign_data(private_key, data):
    # Assina os dados através de ECDSA
    return private_key.sign(
        data,
        ec.ECDSA(hashes.SHA256())
    )

def verify_signature(public_key, signature, data):
    # verifica a assinatura ECDSA
    try:
        public_key.verify(signature, data, ec.ECDSA(hashes.SHA256()))
        return True
    except InvalidSignature:
        return False
    except Exception as e:
        print(f"Erro na verificação de assinatura: {e}")
        return False
    
def generate_mac(session_key, message):
    # Cria um HMAC-SHA256 para manter a integridade da mensagem
    h = hmac.HMAC(session_key, hashes.SHA256())
    h.update(message)
    return h.finalize()

def verify_mac(session_key, message, received_mac):
    # Verifica o HMAC
    h = hmac.HMAC(session_key, hashes.SHA256())
    h.update(message)
    try:
        h.verify(received_mac)
        return True
    except InvalidSignature:
        return False