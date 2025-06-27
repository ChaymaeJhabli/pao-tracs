# Challenge: Hamac

### Documentation: AES Encryption Challenge with RockYou Password List

#### **Challenge Description**
In this challenge, the goal is to decrypt a ciphertext encrypted with AES-CBC mode using a password-derived key. The encryption process involves a secure hashing algorithm (SHA-256) and HMAC for verification. To decrypt the ciphertext and recover the flag, we must identify the correct password from the widely known **RockYou password list**.

### **Encryption Process**
The challenge includes the following encryption steps:
1. **Password-Based Key Derivation**:
   - The AES encryption key is derived by hashing the password with the SHA-256 algorithm.
    $$
    key = SHA256(password)
    $$

2. **AES Encryption**:
   - The plaintext (flag) is encrypted using AES in CBC (Cipher Block Chaining) mode with:
     - A randomly generated **IV** (Initialization Vector).
     - The derived key from step 1.

3. **HMAC Verification**:
   - To validate the password during decryption, an **HMAC** (Hash-Based Message Authentication Code) is computed using:
     - The password as the key.
     - The fixed string `FCSC2022` as the message.
   - The HMAC digest is then stored to ensure integrity and verify the password during decryption.

### **Provided Information**
The challenge provides:
1. `output.txt`: A JSON file containing:
   - `iv`: The initialization vector used for AES encryption (in hexadecimal).
   - `c`: The ciphertext (in hexadecimal).
   - `h`: The HMAC digest used for password verification (in hexadecimal).

2. `rockyou.txt`: A password list containing millions of commonly used passwords.

### **Decryption Process**
To decrypt the flag, the solution follows these steps:

### **Step 1: Load the Encrypted Data**
The script reads the `iv`, ciphertext (`c`), and HMAC (`h`) from `output.txt`:
```python
with open("output.txt", "r") as file:
    data = json.load(file)

iv = bytes.fromhex(data["iv"])
c = bytes.fromhex(data["c"])
h = data["h"]
```

### **Step 2: Derive the AES Key**
The AES key is derived by hashing a candidate password using SHA-256:
```python
def derive_key(password):
    return SHA256.new(password.encode()).digest()
```

### **Step 3: Verify the HMAC**
To check if the password is correct, the HMAC is recomputed using the password and compared to the stored HMAC:
```python
def verify_hmac(password, h):
    hmac = HMAC.new(password.encode(), digestmod=SHA256)
    hmac.update(b"FCSC2022")  # Message used to compute the HMAC
    return hmac.hexdigest() == h
```

### **Step 4: Brute-Force Password Search**
The script iterates through each password in the `rockyou.txt` password list. For each password:
1. Compute its HMAC.
2. If the HMAC matches the stored value, derive the AES key.
3. Attempt to decrypt the ciphertext using the derived key and IV:
   ```python
   cipher = AES.new(key, AES.MODE_CBC, iv=iv)
   flag = unpad(cipher.decrypt(c), 16)
   ```

4. If the padding is valid, the plaintext flag is successfully decrypted.

If the padding is invalid, the script continues searching for the correct password.

### **Step 5: Output Results**
The script outputs the correct password and the decrypted flag once the correct password is found:
```python
print(f"Password found: {password}")
print(f"Decrypted flag: {flag.decode()}")
```

### **Key Python Code**
Here is the complete code for the challenge:

```python
import json
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad
from Crypto.Hash import HMAC, SHA256

# Read the iv, c, and h values from output.txt
with open("output.txt", "r") as file:
    data = json.load(file)

iv = bytes.fromhex(data["iv"])
c = bytes.fromhex(data["c"])
h = data["h"]

# Function to derive the AES key from the password
def derive_key(password):
    return SHA256.new(password.encode()).digest()

# Function to verify the HMAC
def verify_hmac(password, h):
    hmac = HMAC.new(password.encode(), digestmod=SHA256)
    hmac.update(b"FCSC2022")
    return hmac.hexdigest() == h

# Iterate through each password in rockyou.txt
with open("rockyou.txt", "r", encoding="latin-1") as file:
    for line in file:
        password = line.strip()
        if verify_hmac(password, h):
            print(f"Password found: {password}")
            key = derive_key(password)
            cipher = AES.new(key, AES.MODE_CBC, iv=iv)
            try:
                flag = unpad(cipher.decrypt(c), 16)
                print(f"Decrypted flag: {flag.decode()}")
                break
            except ValueError:
                print("Incorrect padding, continue searching...")
```

### **How It Works**
1. **Password Verification with HMAC**:
   - Each password from the `rockyou.txt` list is tested by recomputing the HMAC and checking if it matches the stored value (`h`).

2. **Key Derivation and Decryption**:
   - Once the correct password is identified, it is used to derive the AES key.
   - The derived key and IV are used to decrypt the ciphertext using AES in CBC mode.

3. **Padding Validation**:
   - The decrypted plaintext undergoes padding removal using `unpad`. If the padding is valid, the flag is successfully recovered.

### **Output Example**
If the correct password and flag are found, the script prints:
```plaintext
Password found: omgh4xx0r
Decrypted flag: FCSC{5bb0780f8af31f69b4eccf18870f493628f135045add3036f35a4e3a423976d6}
```

### **Lessons Learned**
1. **Password-Based Key Derivation**:
   - Using SHA-256 for key derivation is better than using raw passwords but can still be brute-forced if weak passwords are used.

2. **HMAC for Password Validation**:
   - HMAC provides an efficient way to verify the correctness of a password without attempting full decryption.

3. **Security Implications**:
   - Relying on commonly used passwords (like those in the RockYou list) undermines encryption security.
   - Using a strong, random password and a more secure key derivation function like PBKDF2, Argon2, or scrypt can make brute-force attacks impractical.
