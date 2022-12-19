def parse(data):
# Parses a line with the following pattern:
# "Time (s)","Gyroscope x (rad/s)","Gyroscope y (rad/s)","Gyroscope z (rad/s)","Absolute (rad/s)"
	# Split each field by ','
	splited = data.split(',')
	splited.pop(3)
	# Empty array for processing
	parsed = []
	for i in splited:
		# Append float version of number to empty array
		parsed.append(float(i))
	return parsed

def norm(data):
	rate = max(data)
	qx = [float(data[0])/rate]
	qy = [float(data[1])/rate]
	qz = [float(data[2])/rate]
	return (rate,qx,qy,qz)

def to_quaternion():
	file = 'data.csv'
	# Open and separate file lines
	lines = (open(file, 'r')).readlines()
	lines.pop(0)
	counter = 0
	quaternions = []
	for line in lines:
		data = parse(line)
		time = data.pop(0)
		quaternions.append(data)
	return quaternions

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
		return conn

def connect(ip, port):
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.settimeout(1)
	s.bind((ip, port))
	s.listen(1)
	try:
		return accept(s)
	except ConnectionAbortedError:
		s.close()
		return False
	except KeyboardInterrupt:
  		s.close()



def main():
	ip = ''
	port = 5000
	buffer = 1024  # Normally 1024, but we want fast response

	connection = connect(ip, port)
	if not connect:
		return 1

	quaternion = to_quaternion()

	counter = 0
	while 1:
		connection.send(quaternion[counter].encode())
		counter = counter+1
	
	data = connection.recv(buffer)
	raise KeyboardInterrupt

main()