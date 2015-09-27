# /* Socket Server Python */

import sys
import socket
import os
from thread import *

master = None

def handle_cmd(cmd):
    global master
    if cmd == "up":
        pass
    elif cmd == "down":
        master = None
        print("giving up control")
    elif cmd == "left":
        pass
    elif cmd == "right":
        pass
    else:
        pass
        # ???

def client(conn, addr):
    global master
    while 1:
        data = conn.recv(1024)
        cmds = data.split("\n")

        for cmd in cmds:
            if cmd == "master?":
                if master == addr:
                    conn.sendall("yes")
                    print("yes ")
                else:
                    conn.sendall("no")
                    print("no")
            else:
                print(cmd)
                handle_cmd(cmd)
    conn.close()


server = os.getenv("CORO_SERVER")
port = int(os.getenv("CORO_PORT"))

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind((server, port))
sock.listen(5)

while 1:
    (conn, addr) = sock.accept()
    if master == None:
        master = addr[0]
    start_new_thread(client, (conn, addr[0]))

sock.close()

