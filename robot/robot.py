/* Socket Server Python */

import sys
import socket
from thread import *

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
    s.bind((127.0.0.1, 1337))
except socket.error as msg:
    print 'Bind failed. Error Code : ' + str(msg[0]) + ' Message ' + msg[1]
    sys.exit()

s.listen(5)

def clientthread(conn):
    while True:

        #Receiving from client
        data = conn.recv(1024)

        if data = "Up"
            # Motors Go Forward then stop
        if data = "Back"
            # Motors Go Back then Stop

        if not data: break

    #came out of loop
    conn.close()

while 1
    conn, addr = s.accept()

    #start new thread takes 1st argument as a function name to be run, second is the tuple of arguments to the function.
    start_new_thread(clientthread ,(conn,))

s.close()
