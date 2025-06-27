# AES Decryption with Scrypt and Brute-Force PIN Attack

This script demonstrates how to decrypt an AES-encrypted ciphertext by attempting to brute-force a 4-digit PIN. The key derivation function `scrypt` is used to derive the encryption key from each PIN, and the AES-GCM mode is used for decryption.

## Code Breakdown

### 1. **Importing Required Libraries**
```python
from Crypto.Cipher import AES
from Crypto.Protocol.KDF import scrypt
from Crypto.Util.number import long_to_bytes
```
- `AES`: The AES cipher from the `pycryptodome` library, which provides encryption and decryption functionality.
- `scrypt`: A key derivation function (KDF) used to securely derive a key from the given PIN.
- `long_to_bytes`: Utility to convert long integers (like PINs) into byte representation, required by `scrypt`.

### 2. **Reading the Encrypted Hex String**
```python
file = "output.txt"
with open(file, "r") as f:
    enc_hex = f.read().strip()

print(f"Encrypted hex string: {enc_hex}")
```
- The script reads the encrypted hex string from `output.txt`. The `strip()` function is used to remove any trailing whitespace or newlines.
- This hex string represents the AES-encrypted data in hexadecimal format.

### 3. **Converting the Hex String to Bytes**
```python
enc = bytes.fromhex(enc_hex)
```
- The encrypted hex string is converted back into a byte array for further processing, as AES encryption works on bytes.

### 4. **Extracting the Nonce, Ciphertext, and Tag**
```python
nonce = enc[:16]
ciphertext = enc[16:-16]
tag = enc[-16:]
```
- The encrypted byte sequence is divided into three parts:
  - `nonce`: The first 16 bytes are the nonce (initialization vector) used in AES-GCM.
  - `ciphertext`: The encrypted message without the nonce and tag.
  - `tag`: The last 16 bytes are the authentication tag used in AES-GCM to ensure data integrity.

### 5. **Brute-Force Attack on 4-Digit PIN**
```python
for pin in range(10000):
```
- The script attempts all possible 4-digit PINs, from 0000 to 9999, in a brute-force manner.

### 6. **Deriving the Key Using Scrypt**
```python
k = scrypt(long_to_bytes(pin), b"FCSC", 32, N=2**10, r=8, p=1)
```
- The key for AES decryption is derived using the `scrypt` function.
  - `long_to_bytes(pin)`: Converts the current PIN into a byte format.
  - `b"FCSC"`: This is the salt value used in the key derivation process to add randomness.
  - `32`: The length of the key to generate (32 bytes = 256 bits for AES-256).
  - `N=2**10, r=8, p=1`: These are the `scrypt` parameters for controlling CPU and memory costs.

### 7. **Decrypting the Ciphertext**
```python
aes = AES.new(k, AES.MODE_GCM, nonce=nonce)
flag = aes.decrypt_and_verify(ciphertext, tag)
```
- Using the derived key (`k`), the script initializes an AES-GCM decryption object with the provided `nonce`.
- The `decrypt_and_verify` method attempts to decrypt the `ciphertext` and verify it using the `tag`.

### 8. **Successful Decryption**
```python
print(f"PIN: {pin}")
print(f"Flag: {flag.decode()}")
break
```
- If decryption succeeds (i.e., no exceptions are thrown), the correct PIN and the decrypted message (flag) are printed.
- The loop then breaks, as the correct PIN has been found.

### 9. **Handling Failed Decryption**
```python
except (ValueError, KeyError):
    continue
```
- If decryption fails due to an incorrect key or an invalid authentication tag, the script catches the `ValueError` or `KeyError` exceptions and continues with the next PIN in the loop.

### 10. **Solution**
- We get the solution after running this code:  
  **PIN**: 6273  
  **Flag**: `FCSC{c1feab88e6c6932c57fbaf0c1ff6c32e51f07ae87197fcd08956be4408b2c802}`



