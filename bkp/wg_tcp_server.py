import socket
from time import sleep
from datetime import datetime, timedelta

def accept(sock):
  # Implementado assim para permitir Ctrl+C quando nao tem cliente conectado ainda
  while True:
    try:
        conn, addr = sock.accept()
    except socket.timeout:
        continue
    return conn, addr

TCP_IP = ''
TCP_PORT = 5000
BUFFER_SIZE = 2000  # Normally 1024, but we want fast response

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.settimeout(1)
s.bind((TCP_IP, TCP_PORT))
s.listen(1)
print ('Server address: ' + (socket.gethostbyname(socket.gethostname())) + ':' + str(TCP_PORT))
print("Waiting for connection...")
try:
    conn, addr = accept(s)
    print ("IP connected:", addr)

    date = "0x" + str(datetime.now().day) + str(datetime.now().month)+ str(datetime.now().year)
    date = int (date,16)
    date = str(date)
    conn.send(date.encode())

    wave='0'
    while 1:
	    data = conn.recv(BUFFER_SIZE)
	    if not data: break
	    print ("Request:", data.decode("utf-8"))
	    if (data.decode("utf-8") == "triangle"):
	    	wave = '01'# onda continua triangular
	    elif (data.decode("utf-8") == "sawtooth"):
	    	wave = '02'# onda continua dente de serra
	    elif (data.decode("utf-8") == "square"):
	    	wave = '03'# onda continua quadrada
	    else:
	    	wave = '00'#solicitacao invalida - zera a entrada e saida
	    
	    conn.send(wave.encode()) #envia a onda solicitada no formato de bytes

	    if (data.decode("utf-8") == "disconnect"):
	    	print("Client requested disconnection")
	    	raise KeyboardInterrupt
	    else:
	    	sleep(2)

except ConnectionAbortedError:
  print("Client disconnected")
  s.close()
except KeyboardInterrupt:
  print("Hosting aborted by the user")
  s.close()