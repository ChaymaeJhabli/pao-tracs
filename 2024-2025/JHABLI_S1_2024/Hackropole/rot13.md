### Challenge: **ROT13**  
**Category:** Cryptanalysis  
**Event:** FCSC 2023  
**Description:**  
Your colleague used the ROT13 cipher to obscure a flag in a text. Prove to them that ROT13 offers no real encryption or security.  

### What is ROT13?  
ROT13 (short for **"rotate by 13 places"**) is a substitution cipher that shifts each letter of the alphabet by 13 positions. For example:  
- `A` becomes `N`, `B` becomes `O`, ..., `N` becomes `A`, and so on.  

Since the alphabet has 26 letters, applying ROT13 twice returns the original text, making it symmetric.

### Encoded Text:  
The flag is included as:  
`SPFP{rq24p7sq86p2s0515366}`  

We need to decode it.

### Decoding ROT13:
ROT13 can easily be decoded by applying the cipher again. Here's the Python script to decode the text:

```python
import codecs

# Encoded message
encoded_message = """
GBQB yvfgr :
- Cnva (2 onthrggrf)
- Ynvg (1 yvger)
- Pbevnaqer (fhegbhg cnf, p'rfg cnf oba)
- 4 onanarf, 4 cbzzrf, 4 benatrf
- Cbhyrg (4 svyrgf qr cbhyrg)
- 1 synt : SPFP{rq24p7sq86p2s0515366}
- Câgrf (1xt)
- Evm (fnp qr 18xt)
- Abheve zba qvabfnher
"""

# Decrypt the entire message using ROT13
decrypted_message = codecs.decode(encoded_message, "rot_13")

print("Decrypted message:")
print(decrypted_message)

```

### Result:
Running the script yields:  
```
Decrypted message:

TODO liste :
- Pain (2 baguettes)
- Lait (1 litre)
- Coriandre (surtout pas, c'est pas bon)
- 4 bananes, 4 pommes, 4 oranges
- Poulet (4 filets de poulet)
- 1 flag : FCSC{ed24c7fd86c2f0515366}
- Pâtes (1kg)
- Riz (sac de 18kg)
- Nourir mon dinosaure
```

The flag is: `FCSC{ed24c7fd86c2f0515366}`

### Reflection:
This challenge highlights the inherent weaknesses of ROT13 as it provides **no actual security**, being reversible without a key. It’s a fun cipher but unsuitable for real-world encryption tasks. By quickly decoding the ROT13-encoded flag, we demonstrate its lack of robustness.