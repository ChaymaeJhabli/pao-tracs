### Challenge: **SMIC (2)**  
**Category:** Cryptanalysis  
**Event:** FCSC 2020  
**Description:**  
This challenge revolves around decrypting a message encrypted using RSA. You are provided with a ciphertext `c`, a public key `(n, e)`, and need to compute the plaintext `m`.  

In RSA, decryption requires the private key `d`, which is computed using the modular multiplicative inverse of `e` modulo `φ(n)`, where `φ(n)` is the totient of `n`. The plaintext `m` is recovered using the formula:  
$$
m = c^d \mod n
$$

However, in this challenge, the modulus `n` is small enough to allow **factorization**. By factoring `n`, we can compute `φ(n)`, derive the private key `d`, and decrypt the ciphertext.

---

### Given Values:
- **Ciphertext (c)**:  
  `c = 63775417045544543594281416329767355155835033510382720735973`  
- **Public Key (n, e)**:  
  - `n = 632459103267572196107100983820469021721602147490918660274601`  
  - `e = 65537`

---

### Solution Steps:

1. **Factorizing `n`:**  
    Using SageMath (online IDE: https://sagecell.sagemath.org/), we factorized `n` into its two prime components `p` and `q`.  

    - **SageMath Code**:
    ```python
    # Define the modulus n
    n = 632459103267572196107100983820469021721602147490918660274601

    # Factorize n
    factors = factor(n)
    print("Factors of n:", factors)

    # Extract p and q
    p, q = [factor[0] for factor in factors]
    print("p =", p)
    print("q =", q)
    ```

    - **Output from SageMath**:
    ```
    Factors of n: 650655447295098801102272374367 * 972033825117160941379425504503
    p = 650655447295098801102272374367
    q = 972033825117160941379425504503
    ```

2. **Computing `φ(n)`:**  
   The totient `φ(n)` is calculated as:  
   $$
   φ(n) = (p - 1) \times (q - 1)
   $$

3. **Finding the Private Key `d`:**  
   The private key `d` is the modular multiplicative inverse of `e` modulo `φ(n)`:  
   $$
   d = e^{-1} \mod φ(n)
   $$

4. **Decrypting the Ciphertext:**  
   Once `d` is known, decrypt the ciphertext `c` using:  
   $$
   m = c^d \mod n
   $$

5. **Flag:**  
   The result `m` is the plaintext message, and the flag is in the format:  
   $$
   \text{FCSC}\{m\}
   $$

---

### Python Code:

```python
from Crypto.Util.number import inverse

# Given values
n = 632459103267572196107100983820469021721602147490918660274601
e = 65537
c = 63775417045544543594281416329767355155835033510382720735973

# Step 1: Factorize n into p and q
p = 650655447295098801102272374367
q = 972033825117160941379425504503

# Step 2: Compute φ(n)
phi_n = (p - 1) * (q - 1)

# Step 3: Compute the private key d
d = inverse(e, phi_n)

# Step 4: Decrypt the ciphertext
m = pow(c, d, n)

# Output the plaintext
print("Plaintext (m):", m)
```

---

### Step-by-Step Explanation:

1. **Factorization:**  
   Using a factorization tool (like `sympy.factorint` or an online service), we find:  
   $$
    p = 650655447295098801102272374367
   $$
   $$
    q = 972033825117160941379425504503
   $$

2. **Compute `φ(n)`:**  
   Substitute `p` and `q`:  
   $$
   φ(n) = (p - 1) \times (q - 1)
   $$

3. **Find `d`:**  
   Using Python's `Crypto.Util.number.inverse` or similar tools, compute `d` as the modular inverse of `e` modulo `φ(n)`.

4. **Decrypt `c`:**  
   Use modular exponentiation to compute `m = c^d \mod n`.  

5. **Result:**  
   The resulting plaintext `m` is the flag content.

---

### Result and Flag:
After running the code, you will get the plaintext `m`, 
```
Plaintext (m): 563694726501963824567957403529535003815080102246078401707923
```
which is the flag:  
**`FCSC{563694726501963824567957403529535003815080102246078401707923}`**