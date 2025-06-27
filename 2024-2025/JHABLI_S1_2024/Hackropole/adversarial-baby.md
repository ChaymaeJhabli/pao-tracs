## Challenge Solution Documentation: **AdveRSArial Crypto (Baby)**

### Description:
In this challenge, we are provided with an `output.txt` file that contains RSA parameters:  
- **n**: the modulus
- **e**: the public exponent (65537, which is a common value)
- **c**: the ciphertext  

The task is to decrypt the ciphertext and extract the flag.

### Observations:
1. Upon examining `n` in base 10, nothing particularly suspicious stands out. However, when we convert `n` to hexadecimal, a pattern emerges:

```python
n_hex = hex(n)[2:]
print(n_hex)
```

Output:
```
10000800000000000400000000000000000000100080004420120008002000010014000800008000c004040011002008002000001000000000a0400000010000280004000000000002000000000002000010004801000008102000400000000200200000000100000000000000000000000000000000000000002000000000001
```

2. Similarly, converting `n` to binary reveals that **most of its bits are set to zero**:

```python
n_bin = bin(n)[2:]
print(n_bin)
```

Output:
```
10000000000000000100000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000010000000000000000100010000100000000100100000000000001000000000000010000000000000000000010000000000010100000000000000100000000000000000001000000000000000110000000000010000000100000000000001000100000000001000000000100000000000001000000000000000000000000100000000000000000000000000000000010100000010000000000000000000000000000010000000000000000001010000000000000000100000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000010000000000000000000010000000000000100100000000001000000000000000000001000000100000010000000000000010000000000000000000000000000000000001000000000001000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000001
```

3. Given the sparsity of bits in `n`, the prime factors `p` and `q` are also expected to have most of their bits set to zero. However, factoring `n` directly in Python using `factor(n)` proved too slow. This prompted an exploration of specialized tools, such as **SageMath**, which is particularly well-suited for polynomial factorization. At first, I thought this approach would simplify the task—but it turned out that SageMath could not factorize `n` within a reasonable amount of time. 

### Solution Steps:


At this point, **we needed to be smarter or find a similar write-up** that exploits the sparsity of `n`. 

#### 1. **Polynomial Representation and Factorization**:

The idea is to transform `n` into a polynomial and factorize it as follows:
1. Convert `n` to its binary representation.
2. Treat the binary digits as coefficients of a polynomial where `x` replaces 2.

```sage
# Define the polynomial variable x
x = var('x')

# Convert n to binary digits (list of 0s and 1s) and reverse to align with powers of x
N = n.digits(2)

# Create the polynomial
poly = sum(e * x^i for i, e in enumerate(N))
poly.factor()
```

Output:
```
(x^513 + x^348 + x^327 + x^313 + x^249 + x^212 + 1) * (x^511 + x^494 + x^445 + x^359 + x^320 + x^49 + 1)
```

#### 2. **Recovering `p` and `q`**:
This factorization is much faster. By replacing `x` with 2, we recover the values of `p` and `q`:

```sage
poly_p = x^513 + x^348 + x^327 + x^313 + x^249 + x^212 + 1
p = poly_p(x=2)

poly_q = x^511 + x^494 + x^445 + x^359 + x^320 + x^49 + 1
q = poly_q(x=2)
```

Output:
```
p =  26815615859885194199148049996411692254958731641185360130374543433318025388027501869461427030990935414084875128479962203391492343065290316985075546168754177

q =  6703955111699546927094586295728886856295101772488437969932374169355084483139592121732447937761581686389247431572954518413208217084020226417145371521187841
```

#### 3. **Compute Decryption Key (`d`)**:
Now that we have `p` and `q`, we can calculate  `φ(n)` and the private key `d`:

```python
import gmpy2
from Crypto.Util.number import long_to_bytes

n = gmpy2.mpz(179770685017248789197537661565815269934203562120851089179122414399064734715990794430000078278988633398024403072323955508476586487162411822366599111412534539430740137196265242371128714558362082882520001747685222655863817125733693411058452743768818267918688593648334613756045157321491607233744902053478170361857)
e = 65537
c = "0x000c307feca4371acecab2690800586b967909e12ec3e80184666ca161129f86c6cd87e276127a1f9b672b66ba3d715321b24f7d660a928d829c154dcdc0634b99f51e281c2e138f77a04694ff7aeec25c938cf769fbd7d3f2968f0b96fc5d38a8f742f6a46e70d7eae8280ed61f0328df36497f0cb6251b0e13a2bc5adce6344a"

# Convert c to an integer
c = gmpy2.mpz(c, 16)

# Recover p and q
p =  26815615859885194199148049996411692254958731641185360130374543433318025388027501869461427030990935414084875128479962203391492343065290316985075546168754177
q =  6703955111699546927094586295728886856295101772488437969932374169355084483139592121732447937761581686389247431572954518413208217084020226417145371521187841

# Calculating φ(n)
phi_n = (p - 1) * (q - 1)

# Calculating the private key d using the modular inverse
d = gmpy2.invert(e, phi_n)

# Decrypt the ciphertext
flag = pow(c, d, n)

# Convert the flag to bytes
flag_bytes = long_to_bytes(flag)

print(flag_bytes)
```

Output:
```
b"\x02mF\x03\xb9\xe6(s\xb5\xd0\x88\xdd\xdc|N\n\xbbr\xb8~\x0cI\xce\xea{'\xc8\x7f\x1eS\x8dz\xbcf\x87\xb0\n+\xf2\x19=\x0f3\xef\xa8M'\x8f\x02}\xb8\x07\xee\xe7\xb3\\\xbd\x00FCSC{0224e979da8a6069869ccfc040abb680ffd35e3ba61bcc0e0683662c33fa81c0}"
```

#### 4. **Flag Extraction**:
The flag is:
```
FCSC{0224e979da8a6069869ccfc040abb680ffd35e3ba61bcc0e0683662c33fa81c0}
```

### Conclusion
This challenge highlighted the importance of observing the structure of `n`. While standard factorization approaches were computationally expensive, leveraging the sparsity of `n`'s bits to transform the problem into polynomial factorization was the key to solving it. This approach, combined with SageMath's capabilities, allowed us to break down the RSA modulus and decrypt the ciphertext.