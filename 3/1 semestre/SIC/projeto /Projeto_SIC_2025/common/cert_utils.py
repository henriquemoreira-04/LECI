import datetime
from cryptography import x509
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.exceptions import InvalidSignature
from cryptography.hazmat.primitives.asymmetric import ec

def load_cert_from_file(filepath):
    with open(filepath, "rb") as f: return x509.load_pem_x509_certificate(f.read(), default_backend())
    
def load_private_key(filepath):
    with open(filepath, "rb") as f: return serialization.load_pem_private_key(f.read(), password=None, backend=default_backend())
    
def get_nid_from_cert(cert):
    try: return cert.serial_number.to_bytes(16, byteorder='big')
    except: return b'\x00' * 16

def validate_certificate(cert, ca_cert):
    now = datetime.datetime.now(datetime.timezone.utc)
    try:
        nb = cert.not_valid_before_utc
        na = cert.not_valid_after_utc
    except AttributeError:
        nb = cert.not_valid_before.replace(tzinfo=datetime.timezone.utc)
        na = cert.not_valid_after.replace(tzinfo=datetime.timezone.utc)

    if now < nb or now > na:
        print(f"Certificado expirado.")
        return False
    
    try:
        ca_cert.public_key().verify(cert.signature, cert.tbs_certificate_bytes, ec.ECDSA(hashes.SHA256()))
    except: return False
    return True