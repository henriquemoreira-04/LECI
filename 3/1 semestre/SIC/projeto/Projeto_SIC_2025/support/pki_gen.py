#!/usr/bin/python3


import os
import sys
import datetime
import uuid
from cryptography import x509
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.x509.oid import NameOID, ExtendedKeyUsageOID


def generate_key_pair():
    return ec.generate_private_key(ec.SECP521R1())


def save_pem(obj, filename, is_private=False):
    if is_private:
        data = obj.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        )
    else:
        data = obj.public_bytes(serialization.Encoding.PEM)

    filepath = os.path.join('keys', filename)
    with open(filepath, 'wb') as f:
        f.write(data)

    if is_private:
        os.chmod(filepath, 0o600)


def cert(ca_priv, ca_cert, role="node"):
    priv_key = generate_key_pair()
    nid = uuid.uuid4().int

    attributes = [
        x509.NameAttribute(NameOID.COMMON_NAME, f"{role}"),
        x509.NameAttribute(NameOID.SERIAL_NUMBER, str(nid))
    ]

    if role == "sink":
        attributes.append(x509.NameAttribute(NameOID.ORGANIZATIONAL_UNIT_NAME, u"Sink"))

    subject = x509.Name(attributes)

    builder = x509.CertificateBuilder()
    builder = builder.subject_name(subject)
    builder = builder.issuer_name(ca_cert.subject)
    builder = builder.public_key(priv_key.public_key())
    builder = builder.serial_number(nid)
    builder = builder.not_valid_before(datetime.datetime.now(datetime.timezone.utc))
    builder = builder.not_valid_after(datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(days=365))

    builder = builder.add_extension(
        x509.KeyUsage(
            digital_signature=True,
            content_commitment=False,
            key_encipherment=False,
            data_encipherment=False,
            key_agreement=True,
            key_cert_sign=False,
            crl_sign=False,
            encipher_only=False,
            decipher_only=False
        ), critical=True
    )

    extended_usages = []
    if role == "sink":
        extended_usages.append(ExtendedKeyUsageOID.SERVER_AUTH)
    else:
        extended_usages.append(ExtendedKeyUsageOID.CLIENT_AUTH)
    
    builder = builder.add_extension(
        x509.ExtendedKeyUsage(extended_usages), critical=False
    )

    cert = builder.sign(private_key=ca_priv, algorithm=hashes.SHA256())

    return priv_key, cert


def create_ca():
    priv_key = generate_key_pair()
    
    subject = issuer = x509.Name([
        x509.NameAttribute(NameOID.COMMON_NAME, u"SIC Project Root CA"),
    ])

    builder = x509.CertificateBuilder()
    builder = builder.subject_name(subject)
    builder = builder.issuer_name(issuer)
    builder = builder.public_key(priv_key.public_key())
    builder = builder.serial_number(x509.random_serial_number())
    builder = builder.not_valid_before(datetime.datetime.now(datetime.timezone.utc))
    builder = builder.not_valid_after(datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(days=365))
    
    builder = builder.add_extension(
        x509.BasicConstraints(ca=True, path_length=None), critical=True,
    )
    
    builder = builder.add_extension(
        x509.KeyUsage(
            digital_signature=True,
            content_commitment=False,
            key_encipherment=False,
            data_encipherment=False,
            key_agreement=False,
            key_cert_sign=True,
            crl_sign=True,
            encipher_only=False,
            decipher_only=False
        ), critical=True
    )

    cert = builder.sign(private_key=priv_key, algorithm=hashes.SHA256())

    return priv_key, cert


def main(argv):
    if len(argv) != 2:
        print("Usage: ./pki_gen <number of IoT Devices>")
        return 1

    num_devices = int(argv[1])

    print(f"Generating {num_devices} private and public key(s) certificate(s) for IoT Device(s)...")
    print(f"Generating Sink private and public key certificate...")
    print(f"Generating CA private and public key certificate...")

    if not os.path.exists('keys'):
        os.makedirs('keys')

    ca_key, ca_cert = create_ca()
    save_pem(ca_key, "ca_key.pem", is_private=True)
    save_pem(ca_cert, "ca_cert.pem", is_private=False)
    print(f"CA private key saved in keys/ca_key.pem.")
    print(f"CA public key saved in keys/ca_cert.pem.")

    sink_key, sink_cert = cert(ca_key, ca_cert, role="sink")
    save_pem(sink_key, "sink_key.pem", is_private=True)
    save_pem(sink_cert, "sink_cert.pem", is_private=False)
    print(f"Sink private key saved in keys/sink_key.pem.")
    print(f"Sink public key saved in keys/sink_cert.pem.")

    for i in range(num_devices):
        device_key, device_cert = cert(ca_key, ca_cert, role="node")
        save_pem(device_key, f"device_{i}_key.pem", is_private=True)
        save_pem(device_cert, f"device_{i}_cert.pem", is_private=False)
        print(f"Device {i} private key saved in keys/device_{i}_key.pem.")
        print(f"Device {i} public key saved in keys/device_{i}_cert.pem.")

    print("PKI generation completed successfully.")

    return 0


if __name__ == "__main__":
    main(sys.argv)
    