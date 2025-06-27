# Challenge: Clair Connu

### Documentation: XOR Encryption Challenge Solution

#### **Challenge Description**
In this challenge, we are provided with a hexadecimal-encoded ciphertext (`chex`) that was encrypted using an XOR-based cipher. The encryption process is described as follows:

1. **Key Generation**:
   - A 4-byte key was generated using `os.urandom(4)`, which produces a random sequence of 4 bytes.
   - The 4-byte key is then repeated 20 times to create a key of sufficient length (80 bytes).

2. **Encryption**:
   - The flag (`FLAG`) is XORed with the generated key (using `strxor`) to produce the ciphertext:
     \[
     \text{ciphertext} = \text{FLAG} \oplus \text{key}
     \]
   - The ciphertext is then converted into its hexadecimal representation and stored as `chex`.

3. **Objective**:
   - Given the `chex` string, reverse the encryption process to recover the original flag.

#### **Provided Information**
- **Hexadecimal Ciphertext (`chex`)**:
  ```plaintext
  d91b7023e46b4602f93a1202a7601304a7681103fd611502fa684102ad6d1506ab6a1059fc6a1459a8691051af3b4706fb691b54ad681b53f93a4651a93a1001ad3c4006a825
  ```

- **Known Flag Format**:
  - The flag follows the structure: `FCSC{...}`.
  - The known structure of the flag provides a partial plaintext (`FCSC`).

#### **Solution Approach**
To decrypt the ciphertext and recover the flag, the following steps were performed:

### **Step 1: Convert Hexadecimal to Bytes**
The ciphertext was stored in hexadecimal format (`chex`). It was first converted into a byte array using:
```python
ciphertext = bytes.fromhex(chex)
```

### **Step 2: Known-Plaintext Attack**
We know that the flag starts with the string `FCSC`. Using this knowledge:
1. Take the first 4 bytes of the ciphertext (`ciphertext[:4]`).
2. XOR these 4 bytes with the known plaintext (`FCSC`) to recover the first 4 bytes of the key:
   ```python
   known_plaintext = b"FCSC"
   key_part = strxor(ciphertext[:len(known_plaintext)], known_plaintext)
   ```

3. The first 4 bytes of the key were recovered as `key_part`.

### **Step 3: Reconstruct the Full Key**
The encryption key was constructed by repeating the 4-byte `key_part` cyclically to match the length of the ciphertext:
```python
key = (key_part * (len(ciphertext) // len(key_part) + 1))[:len(ciphertext)]
```

### **Step 4: Decrypt the Ciphertext**
Using the reconstructed key, the ciphertext was XORed back to recover the plaintext flag:
```python
flag = strxor(ciphertext, key)
```

#### **Recovered Flag**
The decrypted flag was:
```plaintext
FCSC{3ebfb1b880d802cb96be0bb256f4239c27971310cdfd1842083fbe16b3a2dcf7}
```

### **Python Code**
Here is the complete Python code for the solution:

```python
from Crypto.Util.strxor import strxor

# Provided chex string
chex = "d91b7023e46b4602f93a1202a7601304a7681103fd611502fa684102ad6d1506ab6a1059fc6a1459a8691051af3b4706fb691b54ad681b53f93a4651a93a1001ad3c4006a825"
ciphertext = bytes.fromhex(chex)

# Use the known structure to recover the first part of the key.
known_plaintext = b"FCSC"

# Recover the first part of the key
key_part = strxor(ciphertext[:len(known_plaintext)], known_plaintext)

# Extend the key to the length of the ciphertext
key = (key_part * (len(ciphertext) // len(key_part) + 1))[:len(ciphertext)]

# Decrypt the full flag
flag = strxor(ciphertext, key)

print(f"Recovered flag: {flag.decode()}")
```

#### **How the Attack Works**
- **Key Weakness**:
  The key is only 4 bytes long and repeats cyclically. This makes it vulnerable to a known-plaintext attack since the repeating nature of the key allows partial recovery using predictable plaintext (like `FCSC`).

- **Plaintext Structure**:
  The known structure of the flag provided enough information to recover the first part of the key. Once the key's first 4 bytes were determined, reconstructing the full key was straightforward.

- **Reversibility of XOR**:
  XOR encryption is symmetric, meaning:
  \[
  \text{plaintext} = \text{ciphertext} \oplus \text{key}
  \]

### **Lessons Learned**
1. **Key Reuse is Insecure**:
   - Repeating keys (or short keys) in encryption are insecure as they introduce patterns that can be exploited.
   - A one-time pad (OTP) is only secure if the key is random, as long as the plaintext, and used only once.

2. **Known-Plaintext Vulnerabilities**:
   - Predictable plaintext (e.g., `FCSC{...}`) can be used to compromise encryption systems.

3. **Best Practices**:
   - Use secure key management techniques.
   - Avoid repeating keys in encryption.
