# Challenge: Crayon Cochon

### **Documentation: Pigpen (Crayon Cochon) Cipher Challenge**

#### **Challenge Description**
In this challenge, we are provided with a PNG image. The objective is to find the **flag**, which does not follow the usual `FCSC{}` format.

### **Analysis of the Image**
1. **Initial Observations**:
   - Upon opening the image, it displays a picture of a pig and some incomprehensible text.
   - The pig and the nonsensical text are **clues** that point towards the type of cipher used.

2. **Clue Interpretation**:
   - Since this is a cryptography challenge, the mention of "pig" led us to consider a cipher related to it. A quick search using **Google Lens** revealed the **Pigpen Cipher**, a substitution cipher that uses symbols composed of lines and dots.

### **Solution Steps**
To extract and decrypt the text from the image, we follow these steps:

### **Step 1: Extract the Symbols**
Carefully observe the symbols present in the image. Each symbol corresponds to a specific letter in the **Pigpen Cipher** system. These symbols are composed of:
- Lines forming grids or "pigpen"-like structures.
- Dots placed inside these structures to indicate specific letters.

### **Step 2: Decrypt the Symbols**
Using the symbols extracted from the image, decrypt them with an online tool like [Boxentriq Pigpen Cipher Decoder](https://www.boxentriq.com/code-breaking/pigpen-cipher). Follow these steps:
1. Identify each symbol on the image.
2. Match the symbols one by one using the **Pigpen Cipher chart** provided by the tool.
3. Enter the decoded letters into the tool to reconstruct the text.

### **Step 3: Recovered Text**
Using the **Pigpen Cipher**, the symbols from the image decrypt to:
```plaintext
BELOW IS THE FLAG 
KFNOKBHDBLEBSVJMRXKYOXDQZAEAH
```

### **Step 4: Extract the Flag**
The text contains the flag at the end:
```plaintext
KFNOKBHDBLEBSVJMRXKYOXDQZAEAH
```

### **Key Takeaways**
1. **Pigpen Cipher**:
   - The Pigpen Cipher is a simple substitution cipher that replaces letters with symbols derived from grid-like structures.
   - It was often used in historical contexts but is relatively easy to break with modern tools.

2. **Symbol Recognition**:
   - Challenges like these require careful observation to correctly interpret symbols, as one small mistake can result in an incorrect decryption.

3. **Use of Online Tools**:
   - The availability of tools like [Boxentriq Pigpen Cipher](https://www.boxentriq.com/code-breaking/pigpen-cipher) greatly simplifies the process of decoding such ciphers.

### **Complete Solution Summary**
1. Open the provided image and identify symbols that hint at the **Pigpen Cipher**.
2. Use tools like **Google Lens** or online cipher decoders to analyze the symbols.
3. Input the symbols into the **Pigpen Cipher Decoder** to recover the text.
4. Extract the flag from the decrypted text.

The decrypted flag for this challenge is:
```plaintext
KFNOKBHDBLEBSVJMRXKYOXDQZAEAH
```

### **Final Notes**
This challenge emphasizes the importance of recognizing cipher patterns and leveraging online tools effectively. It also illustrates how clues embedded in challenges (like the pig image) can guide solvers to the correct cryptographic technique.