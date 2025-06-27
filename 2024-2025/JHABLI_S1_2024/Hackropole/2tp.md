### Solution Documentation for the 2TP Challenge

#### Challenge Description
The challenge provides a service that encrypts input strings using AES-GCM, with PBKDF2 used to derive the encryption key. The service also provides the encrypted flag: 

```
Encrypted flag: 7b656d3993152e8f04f8273ca1509e27a3e39249cf4784e23b81d5f2524fee75f6b28a6a07a128e4880e770bc70b32bd7d5f37bb5eba76d38edb8d1964733b
```

The service allows you to encrypt arbitrary input strings and returns their corresponding ciphertexts. The vulnerability lies in the reuse of the Initialization Vector (IV), which is critical for AES-GCM security.

#### Exploitation Steps

1. **Understanding the Flaw:**
   - AES-GCM is a stream cipher when used for encryption. The same IV and key combination generates the same keystream for encryption.
   - If the IV is reused (as is the case here), encrypting the same input produces the same ciphertext, making the keystream predictable.

2. **Recovering the Keystream:**
   - To decrypt the encrypted flag, we need to recover the keystream. This can be achieved by encrypting a known plaintext of the same length as the flag.
   - By XORing the ciphertext of this known plaintext with the plaintext itself, the keystream can be extracted.

3. **Encrypting a Known Plaintext:**
   - Use the service to encrypt a string of the character `a` repeated multiple times (e.g., 128 times), ensuring the resulting ciphertext is at least as long as the encrypted flag:
     ```
     Input: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
     Output Ciphertext: 5f475f1b8910788b55a1766ff9039b7ff7e4c21b9f43d5b468d485f20a16eb77a1b0da6a07f179b7de562e529f175954d915de810a50f35eb3c4e864486bbce1cb8c14b16b30fe5262136280e17dd30eeeb17a231e370c754e4c20a3eda3a50919778749b25647e5d41ac5fad2fb078f8bcb91a39599242bfd28729fb9d65211cb6cfcaa02bac29b7c9502ef5974d81c369ce5705a2a
     ```

4. **Extracting the Keystream:**
   - XOR the ciphertext of the known plaintext with the ASCII value of the character `a` to recover the keystream:
     ```python
     encrypted = bytes.fromhex("5f475f1b8910788b55a1766ff9039b7ff7e4c21b9f43d5b468d485f20a16eb77a1b0da6a07f179b7de562e529f175954d915de810a50f35eb3c4e864486bbce1cb8c14b16b30fe5262136280e17dd30eeeb17a231e370c754e4c20a3eda3a50919778749b25647e5d41ac5fad2fb078f8bcb91a39599242bfd28729fb9d65211cb6cfcaa02bac29b7c9502ef5974d81c369ce5705a2a")
     flux = bytes([ord('a') ^ x for x in encrypted])
     ```

     The result (`flux`) is the keystream used to encrypt plaintexts.

5. **Decrypting the Flag:**
   - XOR the encrypted flag with the extracted keystream to recover the plaintext flag:
     ```python
     flag = bytes.fromhex("7b656d3993152e8f04f8273ca1509e27a3e39249cf4784e23b81d5f2524fee75f6b28a6a07a128e4880e770bc70b32bd7d5f37bb5eba76d38edb8d1964733b")
     decrypted_flag = bytes([a ^ b for a, b in zip(flag, flux)])
     print(decrypted_flag)
     ```

6. **Result:**
   - The code outputs returned:
     ```
     b'ECSC{d7e080292d95f131e07241a98dc6c1aa10279889}\n\x88\xc5+\x88[5\x8b\xe4\xec\\~\x04\x1cMy\xe6'
     ```
   - The decrypted flag is:
     ```
     ECSC{d7e080292d95f131e07241a98dc6c1aa10279889}
     ```

#### Key Takeaways
- Reusing the IV in AES-GCM is a critical vulnerability, as it allows an attacker to derive the keystream and decrypt any ciphertext encrypted with the same key and IV.
- AES-GCM should always use a unique IV for every encryption operation to maintain confidentiality and security.