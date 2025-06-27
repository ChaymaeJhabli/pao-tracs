# Challenge: Rien à signaler

## Overview:
The given code snippet encrypts a flag using RSA encryption and provides the public key `(e, n)` and the ciphertext `c`. However, due to a potential issue in the implementation, you might not need to factorize `n` (which is computationally expensive for large primes) to decrypt the ciphertext and retrieve the flag.

### Observations:
1. **Key Pair Generation Issue**:
   In the `keygen` function, the RSA private key `(d, n)` and public key `(e, n)` are generated. However, **the order of returned keys is swapped**:
   - The function returns `(sk, pk)` as `(d, n)` and `(e, n)` respectively.
   - This issue leads to using `sk` (the private key) as the public key in subsequent encryption steps.

   As a result, the ciphertext `c` is generated with `sk[0]` (i.e., `d` instead of `e`) and can be decrypted using `pk[0]` (i.e., `e`) without requiring factorization.

### Simplified Decryption Strategy:
Given the output, you can decrypt the ciphertext without factorizing `n` as follows:
1. Use the public exponent `e` (from `pk[0]`) as the decryption key.
2. Compute $$ c ≡ m^e [n] $$

This unintended key swap makes the system vulnerable to immediate decryption by an attacker.

### Corrected Decryption Code:
To decrypt the ciphertext and retrieve the plaintext (the flag), you can use the following code:

```python
from Crypto.Util.number import long_to_bytes

# Provided values
e = 2 ** 16 + 1
n = 15796942747309728499758004731551695370913663306666035509299434642801916886496898004446545897149657535285268305926374338100837909963511256277964036962044387829939281166102731090331978991280163210213940391251452338553405036351243486418991475381065523778778374159216111211039724992140348798301914302441933569705494577465736752087544176074475722982600742085989140379907623574747713824460161103249270448563714176784913386788071348191510218812659925461534747629228752452045853041012162619056264262054391967199115369336548943331022933845667724296738334370747384492830658154258526863726939357154899976616849634493499797766299
c = 8974868290281688737233990325600894780715849339628541493919631966007477856153771121147897587192029426714635875587384109624607194486211852465796766441066196469272988076202321557112300294463883797708163984188107199926745938577562219282934551167072277621808474131345695591468145868455419473050498493285402336637848596791275101533878984692539165395918338275186762268105380646876795842765910627488934075701761752437069042340873474933889573307306539126206460702731582652544213958040586038088129224761895431978602343177304095553828090049657631935349611981192723124744317395844933142968117051307548448128268941861109853064071

# Decrypt the ciphertext
m = pow(c, e, n)

# Convert the integer back to bytes and print the flag
flag = long_to_bytes(m)
print(flag)
```

This code will yield the plaintext flag. The vulnerability arises because the private and public keys are incorrectly swapped in the implementation.

### Output:
Running the above code will decrypt the ciphertext and print the plaintext flag.

```
flag = FCSC{7264bd2db7fae77e0c4e2445e45ed89fbe98f7c1bc8e7796111e32654f1ad1f0}
```
